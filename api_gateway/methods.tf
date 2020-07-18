# Provide an HTTP method to a API Gateway resource (REST endpoint)
resource "aws_api_gateway_method" "ForecourtFileRequestMethod" {
   # The ID of the REST API and the resource at which the API is invoked
   rest_api_id   = aws_api_gateway_rest_api.RestApi.id
   resource_id   = aws_api_gateway_resource.LatestVersionGetResource.id
   
   # The verb of the HTTP request
   http_method   = "GET"
   
   # Whether any authentication is needed to call this endpoint
   authorization = "NONE"
 }
 
# Integrate API Gateway REST API with a Lambda function
 resource "aws_api_gateway_integration" "ForecourtFileRequestFunctionIntegration" {
   # The ID of the REST API and the endpoint at which to integrate a Lambda function
   rest_api_id             = aws_api_gateway_rest_api.RestApi.id
   resource_id             = aws_api_gateway_method.ForecourtFileRequestMethod.resource_id
   
   # The HTTP method to integrate with the Lambda function
   http_method             = aws_api_gateway_method.ForecourtFileRequestMethod.http_method
   
   # Lambda functions can only be invoked via HTTP POST
   integration_http_method = "POST"
   type                    = "AWS"
   
   # The URI at which the API is invoked
   uri                     = "${var.ForecourtFileRequestFunction_arn}" 
   
   passthrough_behavior    = "WHEN_NO_MATCH"
   
     
  request_templates = {
    "application/json" = <<EOF
	#set($inputRoot = $input.path('$'))
	{ 
	"localversion":$input.params('localversion')
	}
	EOF
  }

 }
 
 resource "aws_api_gateway_method_response" "response_200" {
  rest_api_id = "${aws_api_gateway_rest_api.RestApi.id}"
  resource_id = "${aws_api_gateway_resource.LatestVersionGetResource.id}"
  http_method = "${aws_api_gateway_method.ForecourtFileRequestMethod.http_method}"
  status_code = "200"
}

resource "aws_api_gateway_integration_response" "IntegrationResponse" {
  rest_api_id = "${aws_api_gateway_rest_api.RestApi.id}"
  resource_id = "${aws_api_gateway_resource.LatestVersionGetResource.id}"
  http_method = "${aws_api_gateway_method.ForecourtFileRequestMethod.http_method}"
  status_code = "${aws_api_gateway_method_response.response_200.status_code}"
  
   depends_on = [
    aws_api_gateway_integration.ForecourtFileRequestFunctionIntegration
  ]
}