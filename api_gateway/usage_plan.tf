data "aws_api_gateway_api_key" "api_key" {
  id = "rj0mnx307f"
}

resource "aws_api_gateway_usage_plan" "usage_plan" {
  name         = "usage_plan"
  description  = "usage_plan"
  product_code = "MYCODE"

  api_stages {
    api_id = "${aws_api_gateway_rest_api.RestApi.id}"
    stage  = "${var.apiGatewayStageName}"
  }

  quota_settings {
    limit  = 20
    offset = 2
    period = "WEEK"
  }

  throttle_settings {
    burst_limit = 5
    rate_limit  = 10
  }
  
  depends_on = [
    aws_api_gateway_deployment.ForecourtFileRequestFunctionDeployment
  ]
}

resource "aws_api_gateway_usage_plan_key" "usage_plan_key" {
  key_id        = "${data.aws_api_gateway_api_key.api_key.id}"
  key_type      = "API_KEY"
  usage_plan_id = "${aws_api_gateway_usage_plan.usage_plan.id}"
}