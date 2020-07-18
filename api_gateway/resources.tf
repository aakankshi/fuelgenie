# Create an API Gateway resource, which is a certain path inside the REST API
 resource "aws_api_gateway_resource" "StationResource" {
   # The id of the associated REST API and parent API resource are required
   rest_api_id = aws_api_gateway_rest_api.RestApi.id
   parent_id   = aws_api_gateway_rest_api.RestApi.root_resource_id
   
   # The last segment of the URL path for this API resource
   path_part   = "stations"
}

 resource "aws_api_gateway_resource" "LatestVersionResource" {
   rest_api_id = aws_api_gateway_rest_api.RestApi.id
   parent_id   = aws_api_gateway_resource.StationResource.id
   path_part   = "latestversion"
}

 resource "aws_api_gateway_resource" "LatestVersionGetResource" {
   rest_api_id = aws_api_gateway_rest_api.RestApi.id
   parent_id   = aws_api_gateway_resource.LatestVersionResource.id
   path_part   = "{localversion}"
}