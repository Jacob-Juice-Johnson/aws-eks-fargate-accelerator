module "networking" {
  source = "./modules/networking"

  vpc_cidr                = var.vpc_cidr
  public_subnet_settings  = var.public_subnet_settings
  private_subnet_settings = var.private_subnet_settings

  tags = merge(var.tags,
    {
      module = "networking"
    }
  )
}

module "iam" {
  source = "./modules/iam"

  name_prefix = local.resource_name_prefix
  policy_arns = [
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  ]

  tags = merge(var.tags,
    {
      module = "iam"
    }
  )
}

module "eks" {
  source = "./modules/eks"

  name_prefix    = local.resource_name_prefix
  role_arn       = module.iam.role_arn
  subnet_ids     = tolist([module.networking.private_subnet_id_a, module.networking.private_subnet_id_b])
  instance_types = var.eks_instance_types
  fargate_arn    = module.iam.fargate_arn

  tags = merge(var.tags,
    {
      module = "eks"
    }
  )
}
