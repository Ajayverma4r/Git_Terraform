output "publicIp" {
    value = aws_instance.dev1.public_ip
    description = "To print our public Ip"
  
}
output "privateIp" {
    value = "aws_instance.dev1.private_ip"
    description = "To prinnt our private Ip"
    sensitive = true
  
}