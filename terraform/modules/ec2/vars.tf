#################################
##             VPC            ##
#################################
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "public_subnet_az" {
  description = "Availability Zone for the public subnet"
  type        = string
  default     = "us-east-1a"
}

#################################
##             EC2            ##
#################################
variable "instance_name" {
  description = "Prefix used for naming AWS resources"
  type        = string
}

variable "key_pair" {
  description = "The EC2 Key Pair name"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t4g.nano"
}

variable "html_file_path" {
  description = "Path to the local HTML file to serve"
  type        = string
}

variable "tags" {
  description = "Tags applied to all resources"
  type        = map(string)
  default     = {}
}

variable "ebs_optimized" {
  description = "EBS optized?"
  type        = bool
  default     = true
}

variable "monitoring" {
  description = "Enable monitoring"
  type        = bool
  default     = true
}

variable "bucket_name" {
  description = "The name of the S3 bucket for hosting the website."
  type        = string
}
