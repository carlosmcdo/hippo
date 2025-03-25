variable "aws_region" {
  type        = string
  description = "The AWS Region"
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "The name of the S3 bucket for hosting the website."
  type        = string
}

variable "web_site" {
  description = "Should this bucket host a static HTML web page?"
  type        = bool
}

variable "html_file_path" {
  description = "Local path to the static HTML file to deploy."
  type        = string
  default     = "../html/index.html"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "instance_name" {
  description = "The name of the EC2 instance to host the static HTML web page"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance type"
  type        = string
}

variable "key_pair" {
  description = "Key Pair Name"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources."
  type        = map(string)
  default     = {}
}
