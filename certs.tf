module "acm_request_certificate" {
  source                            = "git::https://github.com/cloudposse/terraform-aws-acm-request-certificate.git?ref=master"
  domain_name                       = "example.com"
  process_domain_validation_options = true
  ttl                               = "300"
  subject_alternative_names         = ["*.example.com"]
}