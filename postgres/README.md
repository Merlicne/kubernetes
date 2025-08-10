# PostgreSQL

Configuration for a PostgreSQL instance with persistent storage.

- `postgres-pv.yaml`: Defines a hostPath persistent volume.
- `postgres-pvc.yaml`: Claim that binds to the persistent volume.
- `values.yaml`: Helm values referencing the PVC and setting the database password.

