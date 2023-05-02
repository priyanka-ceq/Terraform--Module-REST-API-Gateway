# Terraform--Module-REST-API-Gateway
This repository contains Terraform Module for API Gateway v1 (REST API).<br>
To run the REST API Gateway module, first update the following secrets:<br><br>
AWS_ACCESS_KEY_ID=your_access_key<br>
AWS_SECRET_ACCESS_KEY=your_secret_access_key<br>
AWS_SESSION_TOKEN=your_session_token<br><br>
To create the API Gateway, following details are required:<br>
module "rest-api-gateway" {<br>
  source             = ".."<br>
  create-api-gateway = Whether_to_create_api_gateway<br><br>
  for_each           = var.rest-apis<br>
  rest-api-name        = "rest_api_name"<br>
  rest-api-description = "rest_api_description"<br>
  endpoint-config-type = ["rest_api_config_type"]<br>
  path-part            = ["rest_api_path_part"]<br>
  http-method          = ["rest_api_http_method_like_get_post"]<br>
  authorization        = ["rest_api_authorization"]<br>
  integration-type     = ["rest_api_integration_type"]<br>
  request-template     = ["rest_api_request_template"]<br>
  status-code          = ["rest_api_status_code"]<br>
  response-template    = ["rest_api_response_template"]<br>
  stage-name           = ["rest_api_stage_name"]<br>
  tags                 = {"tags-key" = "tags-value"}<br>
}