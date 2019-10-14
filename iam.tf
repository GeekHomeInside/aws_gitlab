data "aws_iam_policy_document" "resource_full_access" {
  statement {
    sid       = "FullAccess"
    effect    = "Allow"
    resources = ["arn:aws:s3:::bucketname/path/*"]

    actions = [
      "s3:PutObject",
      "s3:PutObjectAcl",
      "s3:GetObject",
      "s3:DeleteObject",
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads",
      "s3:GetBucketLocation",
      "s3:AbortMultipartUpload",
    ]
  }
}

data "aws_iam_policy_document" "base" {
  statement {
    sid = "BaseAccess"

    actions = [
      "s3:ListBucket",
      "s3:ListBucketVersions",
    ]

    resources = ["arn:aws:s3:::bucketname"]
    effect    = "Allow"
  }
}

module "role" {
  source = "git::https://github.com/cloudposse/terraform-aws-iam-role.git?ref=master"

  enabled   = "true"
  namespace = "${var.namespace}"
  stage     = "${var.stage}"
  name      = "${var.name}"

  policy_description = "Allow S3 FullAccess"
  role_description   = "IAM role with permissions to perform actions on S3 resources"

  principals = {
    AWS = ["arn:aws:iam::${var.account_owner}:role/workers"]
  }

  policy_documents = [
    "${data.aws_iam_policy_document.resource_full_access.json}",
    "${data.aws_iam_policy_document.base.json}",
  ]
}
