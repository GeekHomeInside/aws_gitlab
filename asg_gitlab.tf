locals {
  userdata = <<-USERDATA
    #!/bin/bash
    cat <<"__EOF__" > /home/ec2-user/.ssh/config
    Host *
      StrictHostKeyChecking no
    __EOF__
    chmod 600 /home/ec2-user/.ssh/config
    chown ec2-user:ec2-user /home/ec2-user/.ssh/config
  USERDATA
}

module "autoscale_group" {
  source = "git::https://github.com/cloudposse/terraform-aws-ec2-autoscale-group.git?ref=master"

  namespace = "${var.namespace}"
  stage     = "${var.stage}"
  name      = "${var.name}"

  image_id                    = "${var.image_id_gitlab}"
  instance_type               = "${var.instance_type_gitlab}"
  security_group_ids          = ["${var.security_groups_ids_gitlab}"]
  subnet_ids                  = ["${var.subnet_ids_gitlab}"]
  health_check_type           = "ELB"
  min_size                    = "${var.min_size_gitlab}"
  max_size                    = "${var.max_size_gitlab}"
  wait_for_capacity_timeout   = "5m"
  associate_public_ip_address = true
  user_data_base64            = "${base64encode(local.userdata)}"

  # Auto-scaling policies and CloudWatch metric alarms
  autoscaling_policies_enabled           = "true"
  cpu_utilization_high_threshold_percent = "70"
  cpu_utilization_low_threshold_percent  = "20"
}
