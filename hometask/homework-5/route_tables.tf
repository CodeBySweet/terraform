############## Internet Gateway ##############
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my-vpc.id

  tags = merge(
    { Name = format(local.Name, "igw") },
    local.common_tags
  )

}

############## Public Route Table ##############
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.my-vpc.id

  tags = merge(
    { Name = format(local.Name, "public-route-table") },
    local.common_tags
  )

}

# Internet route in the public route table pointing to the Internet Gateway
resource "aws_route" "public_internet" {
  route_table_id         = aws_route_table.public-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# Associate the Public Route Table with a Public Subnets
resource "aws_route_table_association" "public" {
  count          = length(var.subnet_name)
  subnet_id      = aws_subnet.public-subnet[count.index].id
  route_table_id = aws_route_table.public-route-table.id
}

############## NAT Gateway ##############
resource "aws_nat_gateway" "nat-igw" {
  allocation_id = aws_eip.nat-eip.id
  subnet_id     = aws_subnet.public-subnet[0].id

  tags = merge(
    { Name = format(local.Name, "nat-igw") },
    local.common_tags
  )

}

# Elastic IP for the NAT Gateway
resource "aws_eip" "nat-eip" {
  depends_on = [aws_internet_gateway.igw]

  tags = merge(
    { Name = format(local.Name, "nat-eip") },
    local.common_tags
  )

}

############## Private Route Table ##############
resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.my-vpc.id

  tags = merge(
    { Name = format(local.Name, "private-route-table") },
    local.common_tags
  )


}

# Route for outbound internet traffic in the private route table through the NAT Gateway
resource "aws_route" "private_internet" {
  route_table_id         = aws_route_table.private-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.nat-igw.id
}

# Associate the Private Route Table with a Private Subnets
resource "aws_route_table_association" "private-1" {
  count          = length(var.subnet_name)
  subnet_id      = aws_subnet.private-subnet[count.index].id
  route_table_id = aws_route_table.private-route-table.id
}