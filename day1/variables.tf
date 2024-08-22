variable "ami" {
    description = "adding ami values to main.tf"
    type = string
    default = "ami-02c21308fed24a8ab"
  
}
variable "type" {
    description = "adding instance type to main.tf"
    type = string
    default = "t2.micro"
  
}
variable "key" {
    description = "addint key pair to main.tf"
    type = string
    default = "test-key"
  
}