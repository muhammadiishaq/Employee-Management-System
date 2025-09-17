resource "aws_route_table" "my_rt" {
    vpc_id = aws_vpc.my_vpc.id

    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_ign.id
  }

  tags = {
    Name = "${var.name}-rt"
  }
}


resource "aws_route_table_association" "my_rt_association" {
    subnet_id = aws_subnet.my_subnet.id
    route_table_id = aws_route_table.my_rt.id
}