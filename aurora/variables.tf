variable "vpc-id" {}
variable "subnet-id-1" {}
variable "subnet-id-2" {}
variable "subnet-id-3" {}
variable "security-group-id" {}


variable "region-name" {
    description = "The name for region."
    default = "ap-south-1"
}



variable "environment_name" {
    description = "The name of the environment"
    default = "auroratest"
}

variable "vpc_name" {
  description = "The name of the VPC that the RDS cluster will be created in"
  default = "aurora-test"
}


variable "rds_master_username" {
  description = "The ID's of the VPC subnets that the RDS cluster instances will be created in"
  default = "admin"
}

variable "rds_master_password" {
  description = "The ID's of the VPC subnets that the RDS cluster instances will be created in"
  default = "admin123"
}





