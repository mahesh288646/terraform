output "ec2ip" {
  value       = aws_instance.kubernetes.public_ip
  description = "The name of the Auto Scaling Group"
}