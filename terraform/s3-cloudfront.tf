module "s3" {
  source = "./modules/s3-cloudfront"

  bucket_name    = var.bucket_name
  web_site       = var.web_site
  html_file_path = var.html_file_path
  tags           = var.tags
  aws_region     = var.aws_region
}