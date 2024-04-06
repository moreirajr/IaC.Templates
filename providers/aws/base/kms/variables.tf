variable "deletion_window_in_days" {
  description = "The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key. If you specify a value, it must be between 7 and 30, inclusive. If you do not specify a value, it defaults to 30"
  type = number
  default = 30
}

variable "multi_region" {
  description = "Indicates whether the KMS key is a multi-Region (true) or regional (false). Default is false."
  type = bool
  default = false
}

variable "enable_key_rotation" {
  description = "Specifies whether key rotation is enabled. Defaults to false."
  type = bool
  default = false
}

variable "tags" {
  type        = map(string)
  description = "Tags to add to the resources being deployed."
  default     = {}
}