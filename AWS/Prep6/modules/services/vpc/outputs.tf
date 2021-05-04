output "vpcid" {
  value       = aws_vpc.vpc.id
  description = "The name of the Auto Scaling Group"
}
output "vpcdefaultroutetable" {
  value       = aws_vpc.vpc.default_route_table_id
  description = "The name of the Auto Scaling Group"
}