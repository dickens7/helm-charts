# hyperf

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
helm install <name> dickens7/hyperf . -n <namespace> 
```

### Uninstallation

```
helm uninstall <name>
```

## Configuration

| Parameter | Description |
|--|--|
|  |  |