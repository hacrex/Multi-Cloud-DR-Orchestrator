# Project Status

## Portfolio Scope

A reference Terraform design for a primary AWS environment and a conditional GCP standby environment. It demonstrates recovery planning, cost-aware standby capacity, and plan-first DR drills.

## Intended Deployment Path

Use `terraform/terraform.tfvars.example` and the documented plan-only drill. DNS, data replication, and workload failover must be implemented and tested for the target application.

## Safety and Validation

This repository contains **non-production reference configuration** unless its deployment guide explicitly states otherwise. Review every Terraform plan and Kubernetes manifest in an isolated account, project, subscription, compartment, or cluster before use. Do not commit credentials, cloud access keys, API tokens, or live state files.

## What to Discuss in an Interview

Explain the architecture, the operational trade-offs, how you would validate a change, how you would roll it back, and the parts that require organisation-specific configuration.
