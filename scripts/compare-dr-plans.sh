#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TF_DIR="$ROOT/terraform"
TFVARS="${1:-$TF_DIR/terraform.tfvars}"

command -v terraform >/dev/null 2>&1 || {
  echo "terraform is required." >&2
  exit 127
}
test -f "$TFVARS" || {
  echo "Provide a non-committed tfvars path as the first argument." >&2
  exit 2
}

cd "$TF_DIR"
terraform fmt -check -recursive
terraform init
terraform validate

for mode in false true; do
  output="$(mktemp)"
  trap 'rm -f "$output"' EXIT
  echo "\n==> Planning with dr_mode_active=$mode"
  terraform plan -input=false -lock=false -no-color -var-file="$TFVARS" -var="dr_mode_active=$mode" | tee "$output"
  printf '\nPlan summary for dr_mode_active=%s:\n' "$mode"
  grep -E 'Plan: [0-9]+ to add, [0-9]+ to change, [0-9]+ to destroy' "$output" || true
  rm -f "$output"
done

echo "Plan comparison completed. Review the output with a peer before any apply."
