# Terraform--Module-REST-API-Gateway
This repository contains Terraform Module for API Gateway v1 (REST API).<br><br>
To run the REST API Gateway module, first update the following secrets:<br><br>
AWS_ACCESS_KEY_ID=your_access_key<br>
AWS_SECRET_ACCESS_KEY=your_secret_access_key<br>
AWS_SESSION_TOKEN=your_session_token<br><br>
To create the API Gateway, following details are required:<br><br>
<pre>module "rest-api-gateway" {
  source             = ".."
  create-api-gateway = Whether_to_create_api_gateway
  
  for_each           = var.rest-apis
  
  rest-api-name        = "rest_api_name"
  rest-api-description = "rest_api_description"
  endpoint-config-type = ["rest_api_config_type"]
  path-part            = ["rest_api_path_part"]
  http-method          = ["rest_api_http_method_like_get_post"]
  authorization        = ["rest_api_authorization"]
  integration-type     = ["rest_api_integration_type"]
  request-template     = ["rest_api_request_template"]
  status-code          = ["rest_api_status_code"]
  response-template    = ["rest_api_response_template"]
  stage-name           = ["rest_api_stage_name"]
  tags                 = {"tags-key" = "tags-value"}
}</pre>