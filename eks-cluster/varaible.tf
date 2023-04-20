variable "cluster-name" {
  default = "bollyson"
  type    = string
}

variable "instance_types" {
  type        = string
  default     = "t3.medium"
  description = "Set of instance types associated with the EKS Node Group. Defaults to [\"t3.medium\"]. Terraform will only perform drift detection if a configuration value is provided"
}

variable "AWS_REGION" {
  default = "us-east-1"
}

variable "keypair-name" {
  default = "MyDevopsClass"
  type    = string
}

variable "vpc_id" {
  type = string
  description = "vpc-00d2e30903e2bb2bd"
  default = "vpc-00d2e30903e2bb2bd"
}

variable "subnet_id" {
  description = "The ID of the subnets to use"
  type        = list(string)
  default     = [
    "subnet-04b611157ee1bd45b",
    "subnet-0b634b30cd62aebbd"
  ]
}


data "aws_ami" "amazon_linux_2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "block-device-mapping.volume-type"
    values = ["gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}