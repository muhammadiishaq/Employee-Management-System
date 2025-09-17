variable "name" {
    default = "session"
    type = string
}

variable "ami" {
    description = "amazon machine image"
    default = "ami-0360c520857e3138f"
    type = string
}

variable "instance_type" {
    default = "t2.micro"
    type = string
}


variable "volume_size" {
    default = 8
    type = number
}

variable "volume_type" {
    default = "gp3"
    type = string
}