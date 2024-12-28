resource "aws_eip" "ngw_eip_1a" {
  domain = "vpc"
  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-eip-1a"
    }
  )
}

resource "aws_eip" "ngw_eip_1b" {
  domain = "vpc"
  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-eip-1b"
    }
  )
}

resource "aws_nat_gateway" "ngw_1a" {
  allocation_id = aws_eip.ngw_eip_1a.id
  subnet_id     = aws_subnet.eks_subnet_private_1a.id

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-ngw-1a"
    }
  )

  depends_on = [aws_internet_gateway.this]
}

resource "aws_nat_gateway" "ngw_1b" {
  allocation_id = aws_eip.ngw_eip_1b.id
  subnet_id     = aws_subnet.eks_subnet_private_1b.id

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-ngw-1b"
    }
  )

  depends_on = [aws_internet_gateway.this]
}

resource "aws_route_table" "private_route_table_1a" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw_1a.id
  }

  tags = {
    Name = "${var.project_name}-private-route-table-1a"
  }
}

resource "aws_route_table" "private_route_table_1b" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw_1b.id
  }

  tags = {
    Name = "${var.project_name}-private-route-table-1b"
  }
}
