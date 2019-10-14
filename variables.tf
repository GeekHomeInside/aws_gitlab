# Convention naming
variable "namespace" {}
variable "stage" {}
variable "name" {}
# VPC
variable "vpc_id" {}
variable "region" {}
# ALB
variable "ip_address_type" {}
# Certificates
variable "domain_name" {}
# IAM
variable "account_owner" {}
# Route 53
variable "parent_zone_id" {}
variable "aliases" {}
# ASG Gitlab
variable "security_groups_ids_gitlab" {}
variable "subnet_ids_gitlab" {}
variable "image_id_gitlab" {}
variable "instance_type_gitlab" {}
variable "min_size_gitlab" {}
variable "max_size_gitlab" {}
# ASG gitlab-runner worker
