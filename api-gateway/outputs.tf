output "rest-api-invoke-url" {
  value = "${aws_api_gateway_deployment.rest-api-deployment.invoke_url}${aws_api_gateway_stage.rest-api-stage.*.stage_name[0]}${aws_api_gateway_resource.rest-api-resource.*.path[0]}"
  description = "Rest API Invoke URL"
}