module "ecr" {
  source  = "cloudposse/ecr/aws"
  version = "0.35.0"

  label_order = var.label_orders.ecr
  delimiter   = "/"

  image_tag_mutability = "MUTABLE"
  max_image_count      = 20
  scan_images_on_push  = false
  force_delete         = true

  context = module.this.context
}
