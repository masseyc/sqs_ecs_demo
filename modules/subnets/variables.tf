variable "project" {
  type        = string
  description = "The name of the Project we are bootstrapping tfscaffold for"
}

variable "environment" {
  type        = string
  description = "The name of the environment for the bootstrapping process; which is always bootstrap"
  default     = "bootstrap"
}

variable "component" {
  type        = string
  description = "The name of the component for the bootstrapping process; which is always bootstrap"
  default     = "bootstrap"
}

variable "module" {
  type        = string
  description = "The name of the module for the bootstrapping process; which is always bootstrap"
  default     = "subnets"
}

variable "default_tags" {
  type        = map(string)
  description = "default tags to apply to all resources"
}

variable "name" {
  type        = string
  description = "The common name for resources in this module"
}

variable "availability_zones" {
  type        = list(string)
  description = "The availability zones to use for the subnets"
}

variable "cidrs" {
  type      = list(string)
  description = "The CIDR blocks to use for the subnets"
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Whether to map public IPs on launch"
  default     = false
}

variable "route_tables" {
  type        = list(string)
  description = "The route tables to use for the subnets"
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID to use for the subnets"
}
