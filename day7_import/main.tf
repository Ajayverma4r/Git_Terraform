resource "aws_instance" "dev" {
    ami = "ami-02c21308fed24a8ab"
    instance_type = "t2.micro"
    key_name = "test-key"
    tags = {
      Name = "My-ec2"
    }
}