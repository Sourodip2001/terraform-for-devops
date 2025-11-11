variable "ec2_instance_type" {
default = "t2.micro"
        type = string
}

variable "env" {

        default = env
        type = string
}

variable "ec2_instance_volume" {

        default = number
        type = number
}
