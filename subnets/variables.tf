variable "subnet_data" {
  type = map(object({
    cidr = string
    availability_zone = string
    map_value = bool
    name = string 
    }))

}
variable "vpc-id" {
  
}
