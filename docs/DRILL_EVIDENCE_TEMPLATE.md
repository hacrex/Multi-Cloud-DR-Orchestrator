# Disaster-Recovery Drill Evidence Template

Use this template after a **non-production** drill. The purpose is to replace assumed recovery claims with evidence.

| Field | Record |
|---|---|
| Drill date and owner | |
| Scenario and trigger | |
| Workload and dependencies in scope | |
| Target RTO / target RPO | |
| Last verified replicated data point | |
| Start time / recovery decision time / service-restored time | |
| Actual RTO / observed data gap | |
| DNS or traffic action taken | |
| Authentication and secret dependencies checked | |
| Monitoring evidence reviewed | |
| Rollback or failback action | |
| Gaps discovered and owner/date for follow-up | |

## Minimum Drill Sequence

1. Run `./scripts/compare-dr-plans.sh terraform/terraform.tfvars` and peer-review the inactive and active standby plans.
2. Confirm the trusted `admin_cidr`, target accounts/projects, key path, and data-replication assumptions.
3. Apply only in a disposable test environment after approval.
4. Validate workload health, data state, and the intended traffic path before declaring recovery.
5. Complete the table above and retain no secrets, IP addresses, or customer data in the published evidence.

## Boundary

Terraform plan output shows intended infrastructure changes. It does not prove application correctness, data consistency, DNS propagation, or an achieved RTO/RPO.
