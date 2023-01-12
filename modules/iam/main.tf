data "aws_caller_identity" "current" {}

resource "aws_iam_role" "this" {
  name = "${var.name_prefix}-eks-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": [ 
          "eks.amazonaws.com",
          "ec2.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY

  tags = var.tags
}

resource "aws_iam_role" "fargate" {
  name = "${var.name_prefix}-fargate-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Condition": {
         "ArnLike": {
            "aws:SourceArn": "arn:aws:eks:${var.tags.region}:${data.aws_caller_identity.current.account_id}:fargateprofile/${var.name_prefix}-eks/*"
         }
      },
      "Principal": {
        "Service": "eks-fargate-pods.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "eks" {
  for_each = var.policy_arns

  policy_arn = each.key
  role       = aws_iam_role.this.name
}

resource "aws_iam_role_policy_attachment" "fargate" {

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"
  role       = aws_iam_role.fargate.name
}
