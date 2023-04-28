output "rest-api-invoke-url" {
  value = module.rest-api-gateway[0].rest-api-invoke-url
  description = "Rest API Invoke URL"
}