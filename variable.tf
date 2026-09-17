variable "ami" {
  description = "ami"
  type        = string
  default     = "ami-0729131ef01366759"
}

variable "instance_type" {
  description = "instance_type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "key-name"
  type        = string
  default     = "newapplication"
}

variable "vpc_id" {
  description = "bolaji vpc"
  type        = string
  default     = "vpc-012f50d45daa804ee"
}

variable "environment" {
  description = "environment e.g., dev, testing, and prod"
  type        = string
  default     = "dev"

}

variable "subnet_ids" {
  description = "subnet"
  type        = list(string)
  default     = ["subnet-0ca3ec9782ca30ce4", "subnet-0cb0d4604ad373eb2", "subnet-053a0639ba9ec52f8"]
}