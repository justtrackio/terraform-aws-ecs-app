#module "alb_ingress" {
#  source  = "cloudposse/alb-ingress/aws"
#  version = "0.25.1"
#
#  label_key_case = ["namespace", "stage"]
#
#  context = module.this.context
#  vpc_id  = var.vpc_id
#}
