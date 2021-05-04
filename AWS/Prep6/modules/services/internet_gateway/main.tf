resource "aws_internet_gateway" "gw" {
  vpc_id = "${var.vpc_id}"
  tags = {
    Name                         = "${var.env}_gw",
    Env                          = "${var.env}",
    "kubernetes.io/cluster/main" = "owned"
  }
}