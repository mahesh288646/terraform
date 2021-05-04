resource "aws_vpc" "vpc" {
  cidr_block = "${var.cidr_blocknumber}"
  tags = {
    Name = "${var.vpc_name}"
    Env  = "dev"
    "kubernetes.io/cluster/main" = "owned"
  }
}