variable "region" {
  description = "Default AWS Region"
  type = string
}

variable "tags" {
  description = "Additional default tags to add to the resources being deployed"
  type        = map(string)
}