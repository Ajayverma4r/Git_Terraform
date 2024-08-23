/*----------launch Ec2-Instance----------*/
resource "aws_instance" "Test" {
    ami = "ami-02c21308fed24a8ab"
    instance_type = "t2.micro"
    key_name = "test-key"
    subnet_id = aws_subnet.public.id
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    tags = {
      Name="my-Ec2"
    }
  
}