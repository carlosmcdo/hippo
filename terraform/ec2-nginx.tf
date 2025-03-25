module "ec2" {
  source = "./modules/ec2"

  instance_name  = var.instance_name
  instance_type  = var.instance_type
  html_file_path = var.html_file_path
  key_pair       = var.key_pair
  bucket_name    = var.bucket_name

  tags = var.tags
}
