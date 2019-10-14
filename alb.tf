module "alb" {
  source    = "git::https://github.com/cloudposse/terraform-aws-alb.git?ref=tags/0.2.0"
  namespace = "${var.namespace}"
  stage     = "${var.stage}"
  name      = "${var.name}"

  vpc_id          = "${var.vpc_id}"
  ip_address_type = "ipv4"

  subnet_ids         = ["${var.subnet_ids_gitlab}"]
  access_logs_region = "${var.region}"
}
