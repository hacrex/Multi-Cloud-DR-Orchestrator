# variables.tf

variable "gcp_project_id" {
  type        = string
  description = "The GCP Project ID where resources will be deployed"
}

variable "gcp_region" {
  type    = string
  default = "us-central1"
}

variable "aws_profile" {
  type        = string
  description = "The AWS Named Profile to use (lighthouse-dr)"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "dr_mode_active" {
  type        = bool
  default     = false
  description = "Scale up standby (GCP) resources if true"
}

variable "admin_cidr" {
  type        = string
  description = "Single trusted CIDR allowed to reach SSH on the demo hosts, for example 203.0.113.10/32."

  validation {
    condition     = can(cidrhost(var.admin_cidr, 0))
    error_message = "admin_cidr must be a valid CIDR, such as 203.0.113.10/32."
  }
}

variable "ssh_public_key_path" {
  type        = string
  description = "Path to a local public key used only in a disposable demo environment."
  default     = "~/.ssh/lighthouse_key.pub"
}
