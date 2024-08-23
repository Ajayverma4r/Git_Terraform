resource "aws_instance" "test" {
    ami = "ami-02c21308fed24a8ab"
    instance_type = "t2.micro"
    availability_zone = "us-east-1f"
    key_name = "test-key"
    tags = {
      Name="backend_Test"

    }
  
}