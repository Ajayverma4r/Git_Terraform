resource "aws_instance" "dependent" {
    ami = "ami-02c21308fed24a8ab"
    instance_type = "t2.micro"
    key_name = "test-key"
}

resource "aws_s3_bucket" "dependent" {
    bucket = "my-cust-bucket-aj"
}