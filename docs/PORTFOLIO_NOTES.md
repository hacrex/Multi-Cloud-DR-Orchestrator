# Portfolio Notes

## My focus

I use this project to discuss the distinction between an infrastructure plan and a recovery capability. Terraform can create a standby environment; it cannot prove data consistency, customer-session behaviour, DNS cutover safety, or business approval for failover.

## Evidence I can show

- `terraform/variables.tf` and `terraform.tfvars.example` for the standby-mode input.
- `docs/DR_DRILL.md` for the plan-first game-day sequence.
- The README for explicit recovery boundaries and follow-up work.

## Known boundary

I do not present unmeasured cost savings, recovery times, or zero-data-loss claims. I would collect those only from a completed drill in a real test environment.
