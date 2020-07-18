# Declare a new API Gateway REST API
resource "aws_api_gateway_rest_api" "RestApi" {
  name        = "RestApi"
  description = "Terraform Serverless Application Example"
}
