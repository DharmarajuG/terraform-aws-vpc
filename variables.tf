variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16" #user can change this value
}

variable "enable_dns_hostnames" {
  type = bool
  default = true
}

variable "common_tags" {
  type = map
  default ={} 
}

variable "vpc_tags" {
  type = map
  default = {} 
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "igw_tags" {
  type = map
  default = {} 
}

variable "public_subnets_cidr" {
  type = list
  validation {
    condition = length(var.public_subnets_cidr) == 2
    error_message = "Public subnet cidr block should have 2 elements"
  }
}

variable "public_subnets_tags" {
  default = {}
}

variable "private_subnets_cidr" {
  type = list
  validation {
    condition = length(var.private_subnets_cidr) == 2
    error_message = "Private subnet cidr block should have 2 elements"
  }
}

variable "private_subnets_tags" {
  default = {}
}

variable "database_subnets_cidr" {
  type = list
  validation {
    condition = length(var.database_subnets_cidr) == 2
    error_message = "Database subnet cidr block should have 2 elements"
  }
}

variable "database_subnets_tags" {
  default = {}
}

variable "nat_gateway_tags" {
  default = {}
}

variable "public_route_table_tags" {
  default = {} 
}

variable "private_route_table_tags" {
  default = {} 
}

variable "database_route_table_tags" {
  default = {} 
}

variable "is_peering_required" {
  type = bool
  default = false
}

variable "accepter_vpc_id" {
  type = string
  default = ""
}

variable "vpc_peering_tags" {
  default = {}
}
