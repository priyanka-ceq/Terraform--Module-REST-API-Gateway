region                 = "us-east-1"
mod-create-api-gateway = true

rest-apis = {
  "0" = {
    mod-rest-api-name        = "rest-api-using-terraform"
    mod-rest-api-description = "REST API created using Terraform Script"
    mod-endpoint-config-type = ["REGIONAL"]
    mod-path-part            = ["cats", "dogs"]
    mod-http-method          = ["GET", "ANY"]
    mod-authorization        = []
    mod-integration-type     = ["MOCK", "MOCK"]
    mod-request-template     = []
    mod-status-code          = ["200", "200"]
    mod-response-template    = []
    mod-stage-name           = ["rest-api-stage"]
    mod-tags = {
      "Purpose" = "Terraform Module for Rest API Gateway"
      "Owner"   = "priyanka@cloudeq.com"
    }
  }
}