resource "aws_key_pair" "my_key" {
        key_name = "my-key"
        public_key = file("public-key-file")
}


resource "aws_default_vpc" "default" {


}


resource "aws_security_group" "my_security_group" {
        name = "mysecurity-group"
        vpc_id = aws_default_vpc.default.id
        tags = {
                Name = "create vpc"
        }

        ingress{
        from_port = 22
        to_port = 22
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"
        }
        ingress{
        from_port = 80
        to_port = 80
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"
        }
        egress{
        from_port = 0
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "-1"
        }
}


resource "aws_instance" "my_instance" {
        ami = "ami-id"
        for_each = tomap ({
        "instance_1" = "t2.micro",
        "instance_2" = "t2.micro"
        })
        instance_type = each.value
        key_name = aws_key_pair.my_key.key_name
        security_groups = [aws_security_group.my_security_group.name]
        root_block_device {
        volume_size = 8
        volume_type = "gp3"
        }
        tags = {
        Name = "myec2instace"
        Environment = "dev"
        }

}
