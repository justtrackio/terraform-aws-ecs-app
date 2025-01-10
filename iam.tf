data "aws_iam_policy_document" "ecs_access" {
  statement {
    actions = [
      "ecs:DescribeServices",
      "ecs:UpdateService",
    ]
    resources = [
      "arn:aws:ecs:${module.this.aws_region}:${module.this.aws_account_id}:service/${data.aws_ecs_cluster.default.cluster_name}/${module.ecs_label.id}"
    ]
  }
}

module "iam_policy_ecs_access" {
  count   = var.ecs_access_policy_enabled ? 1 : 0
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "5.52.2"

  name   = "${module.this.id}-ecs-access"
  policy = data.aws_iam_policy_document.ecs_access.json

  tags = module.this.tags
}
