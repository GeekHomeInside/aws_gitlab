module "alb" {
  source             = "git::https://github.com/cloudposse/terraform-aws-alb.git?ref=tags/0.2.0"
  namespace          = "eg"
  name               = "app"
  stage              = "dev"

  vpc_id             = "xxxxxxxxx"
  ip_address_type    = "ipv4"

  subnet_ids         = ["xxxxxxxx", "xxxxxxxx"]
  access_logs_region = "us-west-2"
}