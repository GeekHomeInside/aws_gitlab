module "production_www" {
  source          = "git::https://github.com/cloudposse/terraform-aws-route53-alias.git?ref=master"
  aliases         = ["www.example.com.", "static1.cdn.example.com.", "static2.cdn.example.com"]
  parent_zone_id  = "${var.parent_zone_id}"
  target_dns_name = "${aws_elb.example.dns_name}"
  target_zone_id  = "${aws_elb.example.zone_id}"
}