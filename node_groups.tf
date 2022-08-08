resource "aws_iam_role" "nodes_general" {
  name = "general-node-group-aca-eks"
  
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}


resource "aws_iam_role_policy_attachment" "worker_node" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.nodes_general.name
}


resource "aws_iam_role_policy_attachment" "aca-cni-general-policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.nodes_general.name
}

resource "aws_iam_role_policy_attachment" "ec2-read-only" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.nodes_general.name
}


resource "aws_eks_node_group" "nodes_general" {
  cluster_name = aws_eks_cluster.cluster.name
  node_group_name = "nodes-general"
  node_role_arn = aws_iam_role.nodes_general.arn

  subnet_ids = [
    aws_subnet.private.id,
    aws_subnet.private2.id
  ]

  scaling_config {
    desired_size = 1
    max_size = 1
    min_size = 1
  }

  ami_type = "AL2_x86_64"
  capacity_type = "ON_DEMAND"
  disk_size = 20
  force_update_version = false
  instance_types = ["t2.micro"]

  labels = {
    role = "node-general"
  }

  depends_on = [
    aws_iam_role_policy_attachment.worker_node,
    aws_iam_role_policy_attachment.aca-cni-general-policy,
    aws_iam_role_policy_attachment.ec2-read-only,
  ]
}
