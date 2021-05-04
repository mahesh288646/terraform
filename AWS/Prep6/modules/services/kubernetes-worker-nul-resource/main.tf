resource "null_resource" "worker_provisioner" {
  connection {
      type        = "ssh"
      user        = "ubuntu"
      host        = "${var.workerip}"
      private_key = file("~/.ssh/id_rsa")
    }
  provisioner "file" {
    source      = "worker.sh"
    destination = "/tmp/worker.sh"
  }
  provisioner "file" {
    source      = "kube-node.yaml"
    destination = "/tmp/kube-master.yaml"
  }
  provisioner "file" {
    source      = "kube-node.yaml"
    destination = "/tmp/kube-node.yaml"
  }  
  provisioner "file" {
    source      = "master.out"
    destination = "/tmp/master.out"
  } 
  provisioner "file" {
    source      = "~/.ssh/id_rsa"
    destination = "/tmp/id_rsa"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/worker.sh",
      "sed -i -e 's/\r$//' /tmp/worker.sh",
      "/tmp/worker.sh > /tmp/worker.out",
      "chmod 400 /tmp/id_rsa",
      "scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i /tmp/id_rsa ubuntu@${var.masterip}:/tmp/response.out /tmp/join.sh",
      "chmod 777 /tmp/join.sh && /tmp/join.sh >> /tmp/worker.out" ]
  }
}