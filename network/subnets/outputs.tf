output "subnets_id" {
  description = "Mapping of subnet names to their IDs."
  value = { for key, subnet in aws_subnet.subnets : key => subnet.id }
}