#################################
##           BUCKET S3         ##
#################################
variable "bucket_name" {
  description = "The name of the S3 bucket."
  type        = string
  validation {
    condition     = length(var.bucket_name) > 3
    error_message = "Bucket name must be at least 4 characters long."
  }
}

variable "web_site" {
  description = "Should this bucket host a static HTML web page?"
  type        = bool
  default     = false
}

variable "index_document" {
  description = "Index document for website hosting."
  type        = string
  default     = "index.html"
}

variable "error_document" {
  description = "Error document for website hosting"
  type        = string
  default     = "error.html"
}

variable "html_file_path" {
  description = "Path to the static HTML file to be deployed"
  type        = string
}

#################################
##        CLOUDFRONT           ##
#################################
variable "cloudfront_comment" {
  description = "Comment for the CloudFront distribution"
  type        = string
  default     = "Static website distribution"
}

variable "aliases" {
  description = "Extra CNAMEs (alternate domain names), if any, for this distribution."
  type        = list(string)
  default     = null
}

variable "compress" {
  description = "Whether you want CloudFront to automatically compress content for web requests."
  type        = bool
  default     = true
}

variable "comment" {
  description = "Any comments you want to include about the distribution."
  type        = string
  default     = null
}

variable "price_class" {
  description = "CloudFront price class"
  type        = string
  default     = "PriceClass_200"
}

variable "enabled" {
  description = "Whether the distribution is enabled to accept end user requests for content."
  type        = bool
  default     = true
}

variable "http_version" {
  description = "The maximum HTTP version to support on the distribution. Allowed values are http1.1, http2, http2and3, and http3. The default is http2."
  type        = string
  default     = "http2"
}

variable "is_ipv6_enabled" {
  description = "Whether the IPv6 is enabled for the distribution."
  type        = bool
  default     = false
}

variable "retain_on_delete" {
  description = "Disables the distribution instead of deleting it when destroying the resource through Terraform. If this is set, the distribution needs to be deleted manually afterwards."
  type        = bool
  default     = false
}

variable "wait_for_deployment" {
  description = "If enabled, the resource will wait for the distribution status to change from InProgress to Deployed. Setting this to false will skip the process."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default     = {}
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}
