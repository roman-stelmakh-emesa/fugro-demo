# API Gateway Demo

## Deploy
```bash
$ make init
$ make plan
$ make apply
```

## API Usage
```bash
$ curl -L -v -X POST \
    -H "Content-Type: application/json" \
    -d '{"text":"Okay google, find out about Fugro in Holland."}' \
    https://ra0l33q4qe.execute-api.eu-central-1.amazonaws.com/api/replace/
```

## Uninstall
```bash
$ make destroy
```
