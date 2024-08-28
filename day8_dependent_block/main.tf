resource "aws_instance" "dependent" {
    ami = "ami-02c21308fed24a8ab"
    instance_type = "t2.micro"
    key_name = "test-key"
    depends_on = [ aws_s3_bucket.dependent ]
}

resource "aws_s3_bucket" "dependent" {
    bucket = "my-cust-bucket-aj"
   
}