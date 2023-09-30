data "aws_ami" "windows" {
  most_recent = true

  filter {
    name   = "name"
    values = ["Windows_Server-2022-English-Full-Base*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}



resource "aws_instance" "web" {
  ami           = data.aws_ami.windows.id
  instance_type = var.instance_type

}
resource "aws_ec2_tag" "example" {
  resource_id = aws_instance.web.id
  for_each = tomap(var.tags)
  key         = each.key
  value       = each.value
}