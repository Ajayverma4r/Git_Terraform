module "ec2_test" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "my-ec2_cluster"
  instance_count         = 1

  ami                    = "ami-02c21308fed24a8ab"
  instance_type          = "t2.micro"
  key_name               = "test-key"
  monitoring             = true
#   vpc_security_group_ids = ["sg-0718a31c4912dd8ff"]
  subnet_id              = "subnet-06c7a879e25a5df46"

#   tags = {
#     Terraform   = "true"
#     Environment = "dev1"
#   }
}