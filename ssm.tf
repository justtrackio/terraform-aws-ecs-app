resource "aws_ssm_parameter" "container_cpu" {
  name  = "/${module.ssm_label.id}/resources/requests/cpu"
  type  = "String"
  value = "128"

  lifecycle {
    ignore_changes = [value]
  }

  tags = module.this.tags
}

resource "aws_ssm_parameter" "container_memory" {
  name  = "/${module.ssm_label.id}/resources/requests/memory"
  type  = "String"
  value = "128"

  lifecycle {
    ignore_changes = [value]
  }

  tags = module.this.tags
}
