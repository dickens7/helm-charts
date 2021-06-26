# apisix-dashborad

> Prerequisites
> - Kubernetes cluster 1.18+
> - Helm 3.1.0+

## Quick Start

- Install the chart

```shell
helm install <name> dickens7/apisix-dashboard . -n <namespace>
```

- Configure the custom plug-in JSONSchema

```shell
helm install <name> dickens7/apisix-dashboard . -n <namespace> --set-file jsonschema=./jsonschema
```

- Uninstallation

```
helm uninstall <name> -n <namespace> 
```

## Configuration

| Parameter | Description | | 
|--|--|
| Config |  |
| config.etcd.endpoints | The etcd endpoints |
| config.etcd.prefix | The etcd prefix |
| config.etcd.username | The etcd username |
| config.etcd.password | The etcd password |
| config.jsonschema | Configure the custom plug-in JSONSchema |