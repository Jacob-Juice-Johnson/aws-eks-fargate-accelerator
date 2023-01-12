variable "tags" {
  type        = map(any)
  description = "key value pairs for vpc resources"
}

variable "vpc_cidr" {
  type        = string
  description = "vpc cidr block"
}

variable "public_subnet_settings" {
  type = map(any)
}

variable "private_subnet_settings" {
  type = map(any)
}