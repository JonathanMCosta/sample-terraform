resource "aws_subnet" "eks_subnet_public_1a" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 1)
  availability_zone       = "${data.aws_region.current.name}a"
  map_public_ip_on_launch = true

  tags = merge(
    local.tags,
    {
      Name                     = "${var.project_name}-public-subnet-1a"
      "kubernetes.io/role/elb" = 1
    }
  )
}

resource "aws_subnet" "eks_subnet_public_1b" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 2)
  availability_zone       = "${data.aws_region.current.name}b"
  map_public_ip_on_launch = true

  tags = merge(
    local.tags,
    {
      Name                     = "${var.project_name}-public-subnet-1b"
      "kubernetes.io/role/elb" = 1
    }
  )
}

resource "aws_route_table_association" "rtb_assoc_1a" {
  subnet_id      = aws_subnet.eks_subnet_public_1a.id
  route_table_id = aws_route_table.this.id
}

resource "aws_route_table_association" "rtb_assoc_1b" {
  subnet_id      = aws_subnet.eks_subnet_public_1b.id
  route_table_id = aws_route_table.this.id
}


#PRIVATE
resource "aws_subnet" "eks_subnet_private_1a" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 3)
  availability_zone = "${data.aws_region.current.name}a"

  tags = merge(
    local.tags,
    {
      Name                              = "${var.project_name}-private-subnet-1a"
      "kubernetes.io/role/internal-elb" = 1
    }
  )
}

resource "aws_subnet" "eks_subnet_private_1b" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 4)
  availability_zone = "${data.aws_region.current.name}b"

  tags = merge(
    local.tags,
    {
      Name                              = "${var.project_name}-private-subnet-1b"
      "kubernetes.io/role/internal-elb" = 1
    }
  )
}
