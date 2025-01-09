
# output "instance_ids" {
#   value = [for instance in aws_instance.web : instance.id]
# }

# output "instance_pub_ip" {
#   value = [for ip in aws_instance.web : ip.public_ip]
# }

# output "instance_ids_old" {
#   value = aws_instance.web[*].id
# }


# output "instance_pub_ip_with_names" {
#   value = {for ip in aws_instance.web : ip.tags["Name"] => ip.public_ip}
# }

# output "instance_name_to_id" {
#   value = { for instance in aws_instance.web : instance.tags["Name"] => instance.id }
# }