resource "aws_route_table" "fuelgenie_vpc_route_table" {
  vpc_id = "${aws_vpc.fuelgenie_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.fuelgenie_vpc_internet_gateway.id}"
  } 
}

resource "aws_route_table_association" "fuelgenie_vpc_route_table_association1" {
  subnet_id      = "${aws_subnet.fuelgenie_subnet1.id}"
  route_table_id = "${aws_route_table.fuelgenie_vpc_route_table.id}"
}

resource "aws_route_table_association" "fuelgenie_vpc_route_table_association2" {
  subnet_id      = "${aws_subnet.fuelgenie_subnet2.id}"
  route_table_id = "${aws_route_table.fuelgenie_vpc_route_table.id}"
}

resource "aws_route_table_association" "fuelgenie_vpc_route_table_association3" {
  subnet_id      = "${aws_subnet.fuelgenie_subnet3.id}"
  route_table_id = "${aws_route_table.fuelgenie_vpc_route_table.id}"
}