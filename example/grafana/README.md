# 安装 Grafana

- [grafana](https://github.com/grafana/helm-charts/tree/main/charts/grafana)

```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm install grafana grafana/grafana -f values.yaml --version 6.42.3
```

## Import Dashboard

- 8919
- 10856
- <https://grafana.com/grafana/dashboards/13865-fgc-nginx01-web-analytics/>
- <https://grafana.com/grafana/dashboards/11719-apache-apisix/>
