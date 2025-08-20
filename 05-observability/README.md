
# 05-observability

Example values and rules to deploy Prometheus/Grafana (kube-prometheus-stack) and Loki+Promtail. Includes a Promtail **syslog receiver** so you can forward syslog into Loki.

## Promtail syslog receiver (Loki)
- Deploy Loki and Promtail via Helm (see repo root README for install commands).
- Apply `promtail-values.yaml` for syslog ingestion.
- Point your `rsyslog`/`syslog-ng` to `<nodeIP>:1514` (UDP/TCP).

## Alerting
- Example PrometheusRule for high pod restarts and API server down.
- Wire Alertmanager to Slack via webhook.
