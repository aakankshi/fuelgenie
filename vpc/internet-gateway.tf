resource "aws_internet_gateway" "fuelgenie_vpc_internet_gateway" {
  vpc_id = "${aws_vpc.fuelgenie_vpc.id}"
}
