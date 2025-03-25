bucket_name   = "www.carlos-prod-test.com"
web_site      = true
key_pair      = "bastion-host-prod"
instance_type = "t4g.nano"
tags = {
  Project     = "HippoStaticWebsite",
  Environment = "Development",
  Owner       = "Carlos"
}
