variable "subnet_data" {
  type = map(object({
    cidr              = string
    availability_zone = string
    map_value         = bool
  }))

}

# variable "private_instances_data" {
#     type        = map(object({
#     ami_id          = string
#     instance_type   = string
#     subnet_name = string
#   }))
# }