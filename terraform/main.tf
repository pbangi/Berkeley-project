provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  name = "eks-vpc"
  cidr = var.vpc_cidr

  azs             = ["ap-southeast-1a", "ap-southeast-1b"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.0.0"

  cluster_name    = "berkeley-eks"
  cluster_version = "1.24"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets

  eks_managed_node_groups = {
    berkeley_ng = {
      name = "berkeley-node-group"
      instance_types = ["t3.medium"]

      scaling_config = {
        desired_size = 2
        max_size     = 3
        min_size     = 1
      }

      ssh_key_name = "berkeley-key"
    }
  }

  tags = {
    Project = "Berkeley"
  }
}

