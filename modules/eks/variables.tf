variable "tags" {
  type        = map(any)
  description = "key value pairs for EKS resources"
}

variable "name_prefix" {
  type        = string
  description = "Name prefix"
}

variable "role_arn" {
  type        = string
  description = "AWS Role ARN to be attached to EKS"
}

variable "fargate_arn" {
  type        = string
  description = "AWS Role ARN to be attached to Fargate profiles"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnets the EKS cluster will span"
}

variable "instance_types" {
  type        = list(string)
  description = "List of valid node instance types"
}
