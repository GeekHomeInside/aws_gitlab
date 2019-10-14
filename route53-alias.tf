module "route53_gitlab" {
  source          = "git::https://github.com/cloudposse/terraform-aws-route53-alias.git?ref=master"
  aliases         = ["${var.aliases}"]
  parent_zone_id  = "${var.parent_zone_id}"
  target_dns_name = "${aws_elb.gitlab.dns_name}"
  target_zone_id  = "${aws_elb.gitlab.zone_id}"
}
