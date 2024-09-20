import base64
import json
import re

debug = True

def lambda_handler(event, context):
    replacements = {
        'Google'  : 'Google©',
        'Fugro'   : 'Fugro B.V.',
        'Holland' : 'The Netherlands'
    }
    
    try:
        input_data = json.loads(event['body'])
        output_text = input_data['text']
        
        for word in replacements.keys():
            output_text = re.sub(word, replacements[word], output_text, flags=re.IGNORECASE)
        
        output_data = { 'text': output_text }
        
        return {
            'isBase64Encoded' : False,
            'statusCode'      : 200,
            'headers'         : { 'Content-Type': 'application/json' },
            'body'            : json.dumps(output_data)
        }
    
    except Exception as e:
        if debug:
            error_msg = repr(e)
        else:
            error_msg = "Internal Server Error"
        
        output_data = { 'error': error_msg }
        
        return {
            'isBase64Encoded' : False,
            'statusCode'      : 500,
            'headers'         : { 'Content-Type': 'application/json' },
            'body'            : json.dumps(output_data)
        }
