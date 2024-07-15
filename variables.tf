variable "project" {
  type        = string
  description = "The project name to namespace all resources to deploy"
}

variable "environment" {
  type        = string
  description = "The environment to deploy the resources to, dev, staging, or prod etc."
}

variable "component" {
  type        = string
  description = "The name of the resorce component, e.g. app, acc, mgmt etc."
}

variable "region" {
  type        = string
  description = "The AWS region to deploy the resources to"
}

variable "default_tags" {
  type        = map(string)
  description = "The default tags to apply to all resources"
}

variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "ecs_image" {
  type        = string
  description = "The ECS image to deploy"
}
