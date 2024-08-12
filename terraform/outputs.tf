output "vpc_id" {
  description = "VPC ID of the VPC created"
  value       = module.vpc.vpc_id
}

output "eks_cluster_id" {
  description = "EKS Cluster ID"
  value       = module.eks.cluster_id
}

output "eks_node_group_arn" {
  description = "ARN of the EKS node group"
  value       = module.eks.eks_managed_node_groups["berkeley_ng"].node_group_arn
}

output "eks_node_group_name" {
  description = "Name of the EKS node group"
  value       = module.eks.eks_managed_node_groups["berkeley_ng"].node_group_id
}

