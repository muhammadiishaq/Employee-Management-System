resource "aws_key_pair" "my_key" {
  key_name   = "${var.name}-key"
  public_key = file("my-key.pub")
}

resource "aws_security_group" "my_security" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "ssh"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "ssh"
  }

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "ssh"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "all acess"
  }

  tags = {
    Name = "${var.name}-security"
  }
}


resource "aws_instance" "my_instance" {
  key_name                    = aws_key_pair.my_key.key_name
  subnet_id                   = aws_subnet.my_subnet.id
  vpc_security_group_ids      = [aws_security_group.my_security.id]
  associate_public_ip_address = true
  ami                         = var.ami
  instance_type               = var.instance_type

  user_data = file("install.sh")

  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  tags = {
    Name = "${var.name}-instance"
  }
}