# Multi-Cloud DR Orchestrator

A small AWS-primary and GCP-standby infrastructure exercise for discussing recovery planning. The Terraform configuration builds demo resources; the useful part of the project is the recovery decision process, not an untested failover claim.

## Plan a drill

```bash
cd terraform
cp terraform.tfvars.example terraform.tfvars
# Fill in sandbox account and project values. Do not commit this file.
cd ..
./scripts/compare-dr-plans.sh terraform/terraform.tfvars
```

The `dr_mode_active` switch shows the intended difference between an inactive and active standby plan. Review both plans before any apply, and run only in disposable AWS and GCP environments.

## Security boundaries

Administrative SSH access requires an explicit `admin_cidr`. The K3s API is not exposed publicly. The configuration is still a demo: replace local key handling, bootstrap scripts, and broad default service-account assumptions before using the design outside a lab.

## Drill evidence

Use `docs/DRILL_EVIDENCE_TEMPLATE.md` to capture a test drill: target and observed RTO/RPO, data check, traffic action, rollback, and follow-up work. A Terraform plan shows intended infrastructure changes; it does not prove data consistency or application recovery.
