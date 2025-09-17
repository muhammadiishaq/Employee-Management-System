resource "aws_internet_gateway" "my_ign" {
    vpc_id = aws_vpc.my_vpc.id


    tags = {
      Name= "${var.name}-ign"
    }


}
  
