module "ecr_label" {
  source  = "justtrackio/label/null"
  version = "0.26.0"

  label_order = var.label_orders.ecr
  delimiter   = "/"

  context = module.this.context
}

module "ecr" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "1.7.1"

  repository_name = module.ecr_label.id
  tags            = module.ecr_label.tags

  attach_repository_policy        = false
  repository_image_scan_on_push   = false
  repository_image_tag_mutability = "MUTABLE"
  repository_force_delete         = true
  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Keep the latest tag",
        selection = {
          countNumber   = 1
          countType     = "imageCountMoreThan"
          tagStatus     = "tagged"
          tagPrefixList = ["latest"]
        },
        action = {
          type = "expire"
        }
      },
      {
        rulePriority = 2,
        description  = "Remove untagged images",
        selection = {
          countNumber = 1
          countType   = "imageCountMoreThan"
          tagStatus   = "untagged"
        },
        action = {
          type = "expire"
        }
      },
      {
        rulePriority = 3,
        description  = "Keep last 30 images",
        selection = {
          tagStatus   = "any",
          countType   = "imageCountMoreThan",
          countNumber = 30
        },
        action = {
          type = "expire"
        }
      }
    ]
  })
}
