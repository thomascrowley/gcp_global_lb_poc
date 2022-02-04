variable "billing_account" {
  description = "The ID of the Billing account you want to use"
}

variable "region1" {
  default = "us-central1"
}
variable "region2" {
  default = "us-east1"
}

variable "project_id" {
  description = "Project ID"
}

variable "ssl" {
  default = false
}

variable "domain" {
  type        = string
  description = "(optional) describe your variable"
  default     = null
}
