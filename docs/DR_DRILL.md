# Disaster-Recovery Drill

## Objective

Validate that the standby infrastructure can be planned and provisioned without changing the primary environment unexpectedly.

## Pre-flight

1. Use dedicated non-production AWS and GCP accounts/projects.
2. Record the application RTO, RPO, data-replication dependency, and the named business approver for a failover decision.
3. Verify that `terraform plan` with `dr_mode_active = false` does not create standby compute.

## Drill

```bash
cd terraform
cp terraform.tfvars.example terraform.tfvars
terraform fmt -check -recursive
terraform init
terraform validate
terraform plan -var='dr_mode_active=false'
terraform plan -var='dr_mode_active=true'
```

Review both plans with a peer. Only apply a reviewed plan in a disposable environment. Verify instance health, network reachability, application recovery, and the documented DNS/traffic shift procedure.

## Evidence and Follow-up

Record the actual start/end time, recovery gaps, data consistency observations, owners contacted, and corrective actions. A DR design is credible only after repeatable game-day validation.
