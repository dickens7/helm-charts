# apisx

> Prerequisites
> - Kubernetes cluster 1.18+
> - Helm 3.0.0+

## Quick Start

### Add Helm repository

```
helm repo add dickens7 https://dickens7.github.io/helm-charts/
```

### Install the chart

```shell
helm install <name> dickens7/apisix . -n <namespace> 
```

### Uninstallation

```
helm uninstall <name> -n <namespace> 
```

## Configuration

| Parameter | Description |
|--|--|
| Image |  |
| image.repository | Image repository |
| image.tag | Image tag |
| image.pullPolicy | The image pull polic |
| image.pullSecrets | The imagePullSecrets names for all deployments |
| Apisix Dashboard | |
| apisix-dashboard.enabled | Enable dashboard to store chart |
| apisix-dashboard.config.etcd.endpoints | The etcd endpoints |
| apisix-dashboard.config.etcd.prefix | The etcd prefix |
| apisix-dashboard.config.etcd.username | The etcd username |
| apisix-dashboard.config.etcd.password | The etcd password |