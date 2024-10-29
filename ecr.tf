locals {
  ecr_repository_lifecycle_policy = var.ecr_repository_lifecycle_policy != "" ? var.ecr_repository_lifecycle_policy != null ? var.ecr_repository_lifecycle_policy : data.aws_ecr_lifecycle_policy_document.lifecycle.json : null
}

data "aws_ecr_lifecycle_policy_document" "lifecycle" {
  rule {
    priority    = 10
    description = "Keep the latest tag"
    selection {
      count_number    = 1
      count_type      = "imageCountMoreThan"
      tag_status      = "tagged"
      tag_prefix_list = ["latest"]
    }
    action {
      type = "expire"
    }
  }

  rule {
    priority    = 20
    description = "Keep 5 deployed tags"
    selection {
      count_number    = 5
      count_type      = "imageCountMoreThan"
      tag_status      = "tagged"
      tag_prefix_list = ["deployed-"]
    }
    action {
      type = "expire"
    }
  }

  rule {
    priority    = 30
    description = "Remove untagged images"
    selection {
      count_number = 1
      count_type   = "imageCountMoreThan"
      tag_status   = "untagged"
    }
    action {
      type = "expire"
    }
  }

  rule {
    priority    = 40
    description = "Keep last 30 images"
    selection {
      count_number = 30
      count_type   = "imageCountMoreThan"
      tag_status   = "any"
    }
    action {
      type = "expire"
    }
  }
}

module "ecr_label" {
  source  = "justtrackio/label/null"
  version = "0.26.0"

  label_order = var.label_orders.ecr
  delimiter   = "/"

  context = module.this.context
}

module "ecr" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "2.3.0"

  repository_name = module.ecr_label.id
  tags            = module.ecr_label.tags

  attach_repository_policy        = false
  repository_image_scan_on_push   = false
  repository_image_tag_mutability = "MUTABLE"
  repository_force_delete         = true
  repository_lifecycle_policy     = local.ecr_repository_lifecycle_policy
}
