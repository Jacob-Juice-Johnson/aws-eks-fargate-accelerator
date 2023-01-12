resource "aws_eks_cluster" "this" {
  name     = "${var.name_prefix}-eks"
  role_arn = var.role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  tags = var.tags
}

resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${var.name_prefix}-eks-node"
  node_role_arn   = var.role_arn
  subnet_ids      = var.subnet_ids
  instance_types  = var.instance_types

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

  update_config {
    max_unavailable = 1
  }

  tags = var.tags

}

resource "aws_eks_fargate_profile" "app_profile" {
  cluster_name           = aws_eks_cluster.this.name
  fargate_profile_name   = "${var.name_prefix}-fargate-profile-app"
  pod_execution_role_arn = var.fargate_arn
  subnet_ids             = var.subnet_ids

  selector {
    namespace = "ms"
    # labels = {
    #   compute = "fargate"
    # }
  }

  tags = var.tags

}
