locals {
  csi = format("%s-%s-%s", var.project, var.environment, var.component)

  default_tags = merge(
    var.default_tags,
    tomap({
      Component = var.component
    })
  )
}
