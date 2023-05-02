resource "aws_api_gateway_rest_api" "rest-api" {
  count       = var.create-api-gateway ? 1 : 0
  name        = var.rest-api-name
  description = var.rest-api-description
  endpoint_configuration {
    types = var.endpoint-config-type
  }
  tags = var.tags
}

resource "aws_api_gateway_resource" "rest-api-resource" {
  count = length(var.path-part)
  rest_api_id = aws_api_gateway_rest_api.rest-api.*.id[0]
  parent_id   = aws_api_gateway_rest_api.rest-api[0].root_resource_id
  path_part   = element(var.path-part, count.index)
}

resource "aws_api_gateway_method" "rest-api-method" {
  count       = length(var.path-part)
  rest_api_id = aws_api_gateway_rest_api.rest-api.*.id[0]
  resource_id = element(aws_api_gateway_resource.rest-api-resource.*.id, count.index)
  http_method = element(var.http-method, count.index)
  authorization = length(var.authorization) > 0 ? element(var.authorization, count.index) : "NONE"
}

resource "aws_api_gateway_integration" "rest-api-method-integration" {
  count       = length(aws_api_gateway_method.rest-api-method.*.id)
  rest_api_id = aws_api_gateway_rest_api.rest-api.*.id[0]
  resource_id = element(aws_api_gateway_resource.rest-api-resource.*.id, count.index)
  http_method = element(aws_api_gateway_method.rest-api-method.*.http_method, count.index)
  type        = length(var.integration-type) > 0 ? element(var.integration-type, count.index) : "MOCK"

  request_templates = {
    "application/json" = jsonencode({
      statusCode = 200
    })
  }
}

resource "aws_api_gateway_method_response" "rest-api-method-response" {
  count       = length(aws_api_gateway_method.rest-api-method.*.id)
  rest_api_id = aws_api_gateway_rest_api.rest-api.*.id[0]
  resource_id = element(aws_api_gateway_resource.rest-api-resource.*.id, count.index)
  http_method = element(aws_api_gateway_method.rest-api-method.*.http_method, count.index)
  status_code = element(var.status-code, count.index)
}

resource "aws_api_gateway_integration_response" "rest-api-method-integration-response" {
  count       = length(aws_api_gateway_integration.rest-api-method-integration.*.id)
  rest_api_id = aws_api_gateway_rest_api.rest-api.*.id[0]
  resource_id = element(aws_api_gateway_resource.rest-api-resource.*.id, count.index)
  http_method = element(aws_api_gateway_method.rest-api-method.*.http_method, count.index)
  status_code = element(aws_api_gateway_method_response.rest-api-method-response.*.status_code, count.index)

  response_templates = {
    "application/json" = jsonencode({
      body = "Hello from the REST API!"
    })
  }
}

resource "aws_api_gateway_deployment" "rest-api-deployment" {
  depends_on = [
    aws_api_gateway_resource.rest-api-resource,
    aws_api_gateway_method.rest-api-method,
    aws_api_gateway_integration.rest-api-method-integration
  ]
  rest_api_id = aws_api_gateway_rest_api.rest-api.*.id[0]
}

resource "aws_api_gateway_stage" "rest-api-stage" {
  count = length(var.stage-name)
  deployment_id = aws_api_gateway_deployment.rest-api-deployment.id
  rest_api_id   = aws_api_gateway_rest_api.rest-api.*.id[0]
  stage_name    = element(var.stage-name, count.index)
}