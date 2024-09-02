provider "aws" {
    region = "us-east-1"
  
}
resource "aws_key_pair" "new1" {
    key_name = "new"
    public_key = file("~/.ssh/id_rsa.pub")
  
}
resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
  
}
resource "aws_subnet" "sub1" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
  
}
resource "aws_internet_gateway" "MyIGW" {
    vpc_id = aws_vpc.myvpc.id
  
}
resource "aws_route_table" "MyRTt" {
    vpc_id = aws_vpc.myvpc.id

    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.MyIGW.id
    }
  
}
resource "aws_route_table_association" "MyRT" {
    subnet_id = aws_subnet.sub1.id
    route_table_id = aws_internet_gateway.MyIGW.id
    
}

resource "aws_security_group" "My_SG" {
    name = "MySg"
    vpc_id = aws_vpc.myvpc.id


     ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web-sg"
  }
}
resource "aws_instance" "MyServer" {
    ami = "ami-02c21308fed24a8ab"
    instance_type = "t2.micro"
    key_name = aws_key_pair.new1.id
    vpc_security_group_ids = [aws_security_group.My_SG.id]
    subnet_id = aws_subnet.sub1.id

    connection {
      type = "ssh"
      user = "linuxos"
      private_key = file("~/.ssh/id_rsa")
      host = self.public_ip
    }
    provisioner "local-exec" {
        command = "touch file500"
    
    }
    provisioner "file" {
        source = "file11"
        destination = "/home/file11"
    
    }
    provisioner "remote-exec" {
            inline = [
    "touch file200",
    "echo hello from aws >> file200",
]
    
    }
}