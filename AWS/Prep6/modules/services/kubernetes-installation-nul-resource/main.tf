resource "null_resource" "example_provisioner" {
  connection {
      type        = "ssh"
      user        = "ubuntu"
      host        = "${var.masterip}"
      private_key = file("~/.ssh/id_rsa")
    }
  provisioner "file" {
    source      = "master.sh"
    destination = "/tmp/master.sh"
  }
  provisioner "file" {
    source      = "kube-master.yaml"
    destination = "/tmp/kube-master.yaml"
  }
  provisioner "file" {
    source      = "kube-node.yaml"
    destination = "/tmp/kube-node.yaml"
  }  
  provisioner "file" {
    source      = "sample.sh"
    destination = "/tmp/sample.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/master.sh",
      "sed -i -e 's/\r$//' /tmp/master.sh",
      "/tmp/master.sh > /tmp/master.out",
      "chmod -R 777 /tmp/sample.sh",
      "/tmp/sample.sh >> /tmp/response.out"
    ]
  }
}