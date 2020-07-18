resource "aws_network_acl" "fuelgenie_vpc_network_acl" {
    vpc_id = "${aws_vpc.fuelgenie_vpc.id}"
    subnet_ids = ["${aws_subnet.fuelgenie_subnet1.id}", "${aws_subnet.fuelgenie_subnet2.id}", "${aws_subnet.fuelgenie_subnet3.id}"]
    
    egress {
        protocol   = "-1"
        rule_no    = 100
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
    }

    ingress {
        protocol   = "-1"
        rule_no    = 100
        action     = "allow"
        cidr_block = "0.0.0.0/0"
        from_port  = 0
        to_port    = 0
    }

  
}
