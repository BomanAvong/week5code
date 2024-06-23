output "my-public-ip" {
  value = aws_lightsail_instance.mycustominstance.public_ip_address
}

output "my-username" {
  value = aws_lightsail_instance.mycustominstance.username
}

output "my-keyname" {
  value = aws_lightsail_instance.mycustominstance.key_pair_name
}
