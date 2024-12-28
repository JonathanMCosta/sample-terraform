resource "aws_iam_role" "eks_mgn_role" {
  name = "${var.project_name}-mng-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-mgn-role"
    }
  )
}

resource "aws_iam_role_policy_attachment" "nmg_AmazonEKSWorkerNodePolicy" {
  role       = aws_iam_role.eks_mgn_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "nmg_AmazonEC2ContainerRegistryReadOnly" {
  role       = aws_iam_role.eks_mgn_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_role_policy_attachment" "nmg_AmazonEKS_CNI_Policy" {
  role       = aws_iam_role.eks_mgn_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}
