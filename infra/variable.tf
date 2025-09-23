variable "name" {
  default = "session"
  type    = string
}

variable "ami" {
  description = "amazon machine image"
  default     = "ami-02d26659fd82cf299"
  type        = string
}

variable "instance_type" {
  default = "t2.micro"
  type    = string
}

variable "volume_size" {
  default = 8
  type    = number
}

variable "volume_type" {
  default = "gp3"
  type    = string

}
