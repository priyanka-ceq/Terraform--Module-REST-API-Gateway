module "rest-api-gateway" {
  source             = "./api-gateway"
  create-api-gateway = var.mod-create-api-gateway
  
  for_each           = var.rest-apis
  rest-api-name        = each.value.mod-rest-api-name
  rest-api-description = each.value.mod-rest-api-description
  endpoint-config-type = each.value.mod-endpoint-config-type
  path-part            = each.value.mod-path-part
  http-method          = each.value.mod-http-method
  authorization        = each.value.mod-authorization
  integration-type     = each.value.mod-integration-type
  request-template     = each.value.mod-request-template
  status-code          = each.value.mod-status-code
  response-template    = each.value.mod-response-template
  stage-name           = each.value.mod-stage-name
  tags                 = each.value.mod-tags
}