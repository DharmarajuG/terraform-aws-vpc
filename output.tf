output "azs" {
  value = data.aws_availability_zones.azs.names
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets" {
  value = aws_subnet.Public[*].id
}   

output "private_subnets" {
  value = aws_subnet.Private[*].id
}

output "database_subnets" {
  value = aws_subnet.Database[*].id
}

