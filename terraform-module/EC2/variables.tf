#
#variable "server-name" {
#}

variable "tags" {
  type = map(string)
}

variable "instance_type" {
  default = "t2.micro"
}