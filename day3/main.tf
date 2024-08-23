/*------------------------------custom_network_configuration----------------------  */
/*---------VPC_Creation------------*/
resource "aws_vpc" "cust" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name="My_Vpc"
    }
  
}
/*-------Subnet_Creation------*/
resource "aws_subnet" "public" {
    vpc_id = aws_vpc.cust.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a" 
    tags = {
      Name="Pub_Sub"
    }
                                            
}
resource "aws_subnet" "private" {
    vpc_id = aws_vpc.cust.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1b"
    tags = {
      Name="Pvt_Sub"
    }
  
}
/*--------creation of Internet Gateway and attach to vpc----------*/
resource "aws_internet_gateway" "cust" {
    vpc_id = aws_vpc.cust.id
    tags = {
      Name="cust_IGW"
    }
  
}
/*--------creation of route Tables and attaching to IG(edit routes)----------------*/
 resource "aws_route_table" "name" {
    vpc_id = aws_vpc.cust.id

route {
    gateway_id = aws_internet_gateway.cust.id
    cidr_block = "0.0.0.0/0"

}

}
/*-------subnet_association add subnet into RT------------*/
resource "aws_route_table_association" "cust" {
    route_table_id = aws_route_table.name.id
    subnet_id = aws_subnet.public.id
  
}
/*-------creation of security group----------*/
resource "aws_security_group" "allow_tls" {
    name = "allow_tls"
    vpc_id = aws_vpc.cust.id
    tags = {
      Name="cust_SG"
    }
    ingress{
        description = "tls from vpc"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress{
        description = "tls from vpc"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }
    egress{
        description = "tlc from vpc"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

  
}