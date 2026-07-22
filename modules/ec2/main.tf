resource "aws_instance" "this" {
  ami           = "ami-0b6d9d3d33ba97d99"
  instance_type = var.instance_type

  tags = {
    Name = "Terraform-EC2"
  }
}