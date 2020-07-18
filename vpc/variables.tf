variable "vpc-cidr" {
    description = "The cidr for vpc."
    default = "172.31.0.0/16"
}

variable "subnet1-cidr" {
    description = "The cidr for vpc."
    default = "172.31.32.0/20"
}

variable "subnet2-cidr" {
    description = "The cidr for vpc."
    default = "172.31.0.0/20"
}

variable "subnet3-cidr" {
    description = "The cidr for vpc."
    default = "172.31.16.0/20"
}

variable "region-name" {
    description = "The name for region."
    default = "ap-south-1"
}


