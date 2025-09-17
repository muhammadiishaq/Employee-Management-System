resource "aws_subnet" "my_subnet" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.0.0/20"
    map_public_ip_on_launch = true 


    tags = {
      Name= "${var.name}-ign"
    }

}