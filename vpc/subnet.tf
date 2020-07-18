resource "aws_subnet" "fuelgenie_subnet1" {
    vpc_id     = "${aws_vpc.fuelgenie_vpc.id}"
    cidr_block = "${var.subnet1-cidr}"
    availability_zone = "${var.region-name}a" 
}

resource "aws_subnet" "fuelgenie_subnet2" {
    vpc_id     = "${aws_vpc.fuelgenie_vpc.id}"
    cidr_block = "${var.subnet2-cidr}"
    availability_zone = "${var.region-name}b"   
}

resource "aws_subnet" "fuelgenie_subnet3" {
    vpc_id     = "${aws_vpc.fuelgenie_vpc.id}"
    cidr_block = "${var.subnet3-cidr}"
    availability_zone = "${var.region-name}c"   
}


output "subnet1-id" {
  value = "${aws_subnet.fuelgenie_subnet1.id}"
}

output "subnet2-id" {
  value = "${aws_subnet.fuelgenie_subnet2.id}"
}

output "subnet3-id" {
  value = "${aws_subnet.fuelgenie_subnet3.id}"
}

