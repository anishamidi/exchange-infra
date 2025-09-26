#!/bin/bash
set -e

MON_NS="monitoring"
LOG_NS="logging"

echo "Deploying Prometheus..."
helm upgrade --install prometheus ./charts/prometheus \
  --namespace $MON_NS \
  --create-namespace \
  -f ./charts/prometheus/values.yaml

echo "Deploying Loki..."
helm upgrade --install loki ./charts/loki \
  --namespace $LOG_NS \
  --create-namespace \
  -f ./charts/loki/values.yaml

echo "Deploying Grafana..."
helm upgrade --install grafana ./charts/grafana \
  --namespace $MON_NS \
  -f ./charts/grafana/values.yaml

echo "Monitoring components deployed to '$MON_NS' and logging components to '$LOG_NS'"

