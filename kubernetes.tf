resource "kubernetes_namespace" "ms" {
  metadata {
    name = "ms"
  }
}

# resource "kubernetes_manifest" "karpenter_provisioner" {
#   yaml_body = <<-YAML
#   apiVersion: karpenter.sh/v1alpha5
#   kind: Provisioner
#   metadata:
#     name: default
#   spec:
#     requirements:
#     # Exclude t series instances as not suitable for production
#       - key: "karpenter.k8s.aws/instance-category"
#         operator: NotIn
#         values: ["t"]
#     # Exclude smaller instance sizes
#       - key: karpenter.k8s.aws/instance-size
#         operator: NotIn
#         values: [nano, micro, small, large]
#       - key: karpenter.sh/capacity-type
#         operator: In
#         values: ["on-demand"]
#     limits:
#       resources:
#         cpu: 1000
#     provider:
#       subnetSelector:
#         Name: "*private*"
#       securityGroupSelector:
#         karpenter.sh/discovery/${module.eks.cluster_id}: ${module.eks.cluster_id}
#       tags:
#         karpenter.sh/discovery/${module.eks.cluster_id}: ${module.eks.cluster_id}
#     ttlSecondsAfterEmpty: 10
#   YAML
# }