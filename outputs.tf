output "vpc_id" {
  description = "ID of the VPC"
  value       = module.networking.vpc_id
}

output "eks_cluster_id" {
  description = "ID of the EKS cluster"
  value       = module.eks.eks_cluster_id
}
