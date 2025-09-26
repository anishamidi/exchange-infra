
# Deployment Instructions

This repository contains all Kubernetes manifests and Helm charts for both **monitoring/logging** and the application.

---

## 1. Deploy Monitoring & Logging Stack

To deploy Prometheus, Loki, and Grafana, use the provided script:

```bash
./deploy-monitoring.sh
```

This script will:
- Create the required namespace(s)
- Install all monitoring and logging components via Helm
- Apply necessary configuration files (e.g., Prometheus ConfigMap)

---

## 2. Deploy the Application

To deploy the application:

```bash
cd apps/exchange
kubectl apply -f .
```

This will apply all manifests for:
- Deployment
- Service
- Ingress
- ConfigMap
- Secrets

---

## Notes
- Ensure you have `kubectl` configured to point to the correct cluster.
- For secrets, prefer using **Sealed Secrets** for security.
- All monitoring and logging components are installed in the `observability` namespace by default.

