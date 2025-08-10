# Grafana

Helm values for deploying Grafana with nginx ingress and optional persistence.

Install using:

```
helm repo add grafana https://grafana.github.io/helm-charts
helm upgrade --install grafana grafana/grafana -f values.yaml
```
