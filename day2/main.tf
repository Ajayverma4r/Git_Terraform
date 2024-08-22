resource "aws_instance" "dev1" {

ami = var.ami
instance_type = var.instance_type
key_name = var.key-pair
tags = {
  Name = "test1"
}
  
}