
resource "aws_instance" "name" {
    ami = "ami-02c21308fed24a8ab"
    instance_type = "t2.micro" 
    key_name = "test-key"
      tags = {
      Name="test"
    }
 

/*-------------Lifecycle meta arguments------------------*/
/*  lifecycle {
    create_before_destroy = true 

    # Terraform will first create a new instance with the updated configuration 
    # and only destroy the old instance once the new one is created and running.

    }*/


/*  lifecycle {
      prevent_destroy = true

      #(resource will be protected from destruction. If we try to run terraform destroy -auto-approve
      # Terraform will prevent this action and give an error message.)(make sure value=true)

    }*/
     

/*  lifecycle {
      ignore_changes = [ tags, ]

      # This means if the tags are modified outside of Terraform (directly in the AWS console), 
      # Terraform will not attempt to revert those changes or recreate the resource.
    }*/
}