resource "aws_instance" "kubernetes" {
  ami                         = "ami-013f17f36f8b1fefb"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_name}"
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.vpc_security_group_ids]
  subnet_id                   = "${var.subnetid}"
  tags = {
    Name = "${var.name}"
    "kubernetes.io/cluster/main" = "owned"
  }
  //depends_on = [aws_default_route_table.route_table]
}