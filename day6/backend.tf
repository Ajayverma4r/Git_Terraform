terraform {
  backend "s3" {
    bucket = "my-cust-bucket-aj"
    key = "dev/terraform.tfstate"
    region = "us-east-1"
    
  }
}