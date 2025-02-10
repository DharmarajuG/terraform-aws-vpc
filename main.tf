resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = merge(
    var.common_tags,
    var.vpc_tags,
    {
        Name = locals.name
    }
  )
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.common_tags,
    var.igw_tags,
    {
        Name = "${locals.name}-igw"
    }
  )
}

resource "aws_subnet" "Public" {
  count = length(var.public_subnets_cidr)
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnets_cidr[count.index]
  availability_zone = local.az_names[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    var.common_tags,
    var.public_subnets_tags,
    {
        Name = "${locals.name}-public-${local.az_names[count.index]}"
    }
  )
}

resource "aws_subnet" "Private" {
  count = length(var.private_subnets_cidr)
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnets_cidr[count.index]
  availability_zone = local.az_names[count.index]

  tags = merge(
    var.common_tags,
    var.private_subnets_tags,
    {
        Name = "${locals.name}-private-${local.az_names[count.index]}"
    }
  )
}

resource "aws_subnet" "Database" {
  count = length(var.database_subnets_cidr)
  vpc_id = aws_vpc.main.id
  cidr_block = var.database_subnets_cidr[count.index]
  availability_zone = local.az_names[count.index]

  tags = merge(
    var.common_tags,
    var.database_subnets_tags,
    {
        Name = "${locals.name}-database-${local.az_names[count.index]}"
    }
  )
}