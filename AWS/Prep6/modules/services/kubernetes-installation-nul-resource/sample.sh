CERT_HASH=$(openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt \
| openssl rsa -pubin -outform der 2>/dev/null \
| openssl dgst -sha256 -hex \
| sed 's/^.* //')
TOKEN=$(sudo kubeadm token list -o json | jq -r '.token' | head -1)
IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
PORT=6443
echo "sudo kubeadm join $IP:$PORT \
--token=$TOKEN --discovery-token-ca-cert-hash sha256:$CERT_HASH"