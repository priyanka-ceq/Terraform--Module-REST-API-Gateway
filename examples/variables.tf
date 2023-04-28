variable "region" {
  type        = string
  description = "AWS Provider Region"
}

variable "rest-apis" {
  type        = any
  description = "Creating Multiple API Gateways using for_each"
}

variable "mod-create-api-gateway" {
  type        = bool
  description = "Whether to create API Gateway"
}