############## Public Subnets ##############
resource "aws_subnet" "public-subnet" {
  count             = length(var.subnet_name)
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.public_subnet_cidr_block[count.index]
  availability_zone = var.subnets_az[count.index]

  tags = {
    Name = "public-subnet-${var.subnet_name[count.index]}"
  }
}

############## Private Subnets ##############
resource "aws_subnet" "private-subnet" {
  count             = length(var.subnet_name)
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.private_subnet_cidr_block[count.index]
  availability_zone = var.subnets_az[count.index]

  tags = {
    Name = "private-subnet-${var.subnet_name[count.index]}"
  }
}