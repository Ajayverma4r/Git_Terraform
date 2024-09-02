resource "aws_instance" "import" {
    ami = "ami-066784287e358dad1"
    instance_type = "t2.micro"
    key_name = "test-key"
  
}