# Created a new API Gateway deployment
resource "aws_api_gateway_deployment" "ForecourtFileRequestFunctionDeployment" {
   # Remove race conditions - deployment should always occur after lambda integration
   depends_on  = [ aws_api_gateway_integration.ForecourtFileRequestFunctionIntegration ]
   rest_api_id = aws_api_gateway_rest_api.RestApi.id
   
   # development stage
   stage_name  = "test"
 }
 

  resource "aws_lambda_permission" "ForecourtFileRequestFunctionLambdaPermissions" {
   # An optional identifier for the permission statement
   statement_id  = "AllowAPIGatewayInvoke"
   
   # The action this permission allows is to invoke the function
   action        = "lambda:InvokeFunction"
   
   # The name of the lambda function to attach this permission to
   function_name =  "${var.ForecourtFileRequestFunction}"
   
   # The item that is getting this lambda permission
   principal     = "apigateway.amazonaws.com"

   # The "/*/*" portion grants access from any method on any resource
   # within the API Gateway REST API.
   source_arn = "${aws_api_gateway_rest_api.RestApi.execution_arn}/*/*"
 }

# URL to invoke the API
output "base_url" {
  value = aws_api_gateway_deployment.ForecourtFileRequestFunctionDeployment.invoke_url
}