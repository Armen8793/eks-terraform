resource "aws_eks_cluster" "cluster" {
  name = var.cluster
  version = var.cluster_version
  role_arn = aws_iam_role.eks.arn

  vpc_config {
    endpoint_private_access = false
    endpoint_public_access = true
    public_access_cidrs    = ["0.0.0.0/0"]

    subnet_ids = [
      aws_subnet.private.id,
      aws_subnet.private2.id,
      aws_subnet.public.id,
      aws_subnet.public2.id
    ]
  }
  
  depends_on = [aws_iam_role_policy_attachment.aca-eks-policy]
}
