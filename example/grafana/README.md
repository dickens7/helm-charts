# 安装 Grafana

- [grafana](https://github.com/grafana/helm-charts/tree/main/charts/grafana)

```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm install grafana grafana/grafana -f values.yaml --version 6.22.0
```
