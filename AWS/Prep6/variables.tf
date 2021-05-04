variable "external_ip" {
  type    = string
  default = "0.0.0.0/0"
}
variable "env" {
  type    = string
  default = "dev"
}
variable "instance-type" {
  type    = string
  default = "t3.medium"
}