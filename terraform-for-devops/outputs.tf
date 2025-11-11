output "aws_instance_public_ip" {
        value = [
        for key in aws_instance.my_instance : key.public_ip
]
}

output "aws_instance_private_ip" {
        value = [
        for key in aws_instance.my_instance : key.private_ip
        ]
}
