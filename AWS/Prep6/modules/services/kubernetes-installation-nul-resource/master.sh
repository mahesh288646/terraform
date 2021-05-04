touch /tmp/tempo.txt
sudo apt-get update
sudo apt-get install docker.io -y
docker version
cat <<EOF | sudo tee /etc/docker/daemon.json
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF
sudo systemctl enable docker
sudo systemctl status docker
sudo systemctl start docker
sudo systemctl status docker
sudo apt-get install curl -y
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
sudo apt-get install kubeadm kubelet kubectl -y
swapoff -a
#kubeadm config migrate --old-config /tmp/kube-master.yaml --new-config /tmp/new.yaml
sudo kubeadm init --config "/tmp/kube-master.yaml"
sudo apt-get install jq -y