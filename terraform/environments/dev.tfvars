bucket_name        = "www.carlos-dev-test.com"
web_site           = true
vpc_cidr           = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"
instance_name      = "hippo-static-webpage"
key_pair           = "test"
instance_type      = "t4g.nano"
tags = {
  Project     = "HippoStaticWebsite",
  Environment = "Development",
  Owner       = "Carlos"
}
