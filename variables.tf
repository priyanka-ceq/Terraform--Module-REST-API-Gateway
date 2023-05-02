variable "tags" {
  type        = any
  description = "Tags"
}

variable "create-api-gateway" {
  type        = bool
  description = "Whether to create API Gateway"
}

variable "rest-api-name" {
  type        = string
  description = "REST API Name"
}

variable "rest-api-description" {
  type        = string
  description = "REST API Descrption"
}

variable "endpoint-config-type" {
  type        = list(any)
  description = "Endpoint Configuration Type (REGIONAL / EDGE / PRIVATE)"
}

variable "path-part" {
  type        = list(any)
  description = "REST API Path Part"
}

variable "http-method" {
  type        = list(any)
  description = "REST API HTTP Method (GET, POST, PUT, DELETE, HEAD, OPTIONS, ANY)"
}

variable "authorization" {
  type        = list(any)
  description = "REST API Authorization"
}

variable "integration-type" {
  type        = list(any)
  description = "Integration input type (HTTP: for HTTP backends, MOCK: not calling any real backend, AWS: for AWS services, AWS_PROXY: for Lambda proxy integration, HTTP_PROXY: for HTTP proxy integration)"
}

variable "request-template" {
  type        = list(any)
  description = "Integration's request template"
  sensitive   = true
}

variable "status-code" {
  type        = list(any)
  description = "HTTP Status Code"
}

variable "response-template" {
  type        = list(any)
  description = "Templates integration response body"
}

variable "stage-name" {
  type        = list(any)
  description = "Name of the stage"
}