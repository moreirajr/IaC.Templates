variable "name" {
  description = "Name of the Resource Group"
  type = string
}

variable "tags" {
  description = "Tags of the Resource Group to be deployed"
  type = map(string)
  default = { }
}