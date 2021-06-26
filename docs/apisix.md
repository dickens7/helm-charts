# apisx

> Prerequisites
> - Kubernetes cluster 1.18+
> - Helm 3.1.0+

## Quick Start

- Install the chart

```shell
helm install <name> dickens7/apisix . -n <namespace> 
```

- Uninstallation

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
| [Apisix Dashboard](./apisix-dashboard.md) |  |