output "eks_cluster_id" {
  description = "ID of the EKS Cluster"
  value       = aws_eks_cluster.this.id
}

output "eks_cluster_endpoint" {
  description = "Endpoint for the EKS Kubernetes API server"
  value       = aws_eks_cluster.this.endpoint
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data required to communicate with the cluster"
  value       = aws_eks_cluster.this.certificate_authority[0].data
}
