# Security Boundaries for the DR Demonstration

The Terraform configuration now requires `admin_cidr`; it no longer opens SSH or the K3s API to the internet by default. The K3s API should remain private and be reached through an approved access path in a disposable test environment.

The GCP firewall preserves the internal range and published health-check ranges, then adds only the configured administrator CIDR. The project still uses simple demo infrastructure and must not be treated as a production security baseline. Before any non-demo use, replace bootstrap scripts, public-instance patterns, broad service-account scope, and local key handling with organisation-approved controls.
