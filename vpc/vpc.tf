resource "aws_vpc" "fuelgenie_vpc" {
  cidr_block = "${var.vpc-cidr}"
  enable_dns_hostnames = "true"
}

output "id" {
  value = "${aws_vpc.fuelgenie_vpc.id}"
}
