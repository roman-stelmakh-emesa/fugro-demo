
data "archive_file" "lambda" {
  type             = "zip"
  output_file_mode = "0644"
  output_path      = "${path.root}/lambda.zip"
  source_dir       = "${path.root}/lambda"
}


resource "aws_iam_role" "lambda" {
  name = "api_gateway_demo_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "sts",
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      }
    }
  ]
}
EOF
}

resource "aws_lambda_function" "main" {
  function_name    = "api_gateway_demo"
  description      = "API Gateway demo"
  role             = aws_iam_role.lambda.arn
  handler          = "main.lambda_handler"
  runtime          = "python3.12"
  filename         = data.archive_file.lambda.output_path
  source_code_hash = data.archive_file.lambda.output_base64sha256
  publish          = true
}
