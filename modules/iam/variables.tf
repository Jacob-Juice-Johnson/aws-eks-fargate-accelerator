variable "tags" {
  type        = map(any)
  description = "key value pairs for IAM resources"
}

variable "name_prefix" {
  type        = string
  description = "Name prefix"
}

variable "policy_arns" {
  type        = set(string)
  description = "AWS managed role arns to be leveraged by EKS and EKS Node Group"
}