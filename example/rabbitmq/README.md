# 安装 Rabbitmq

- [bitnami-rabbitmq](https://artifacthub.io/packages/helm/bitnami/rabbitmq)

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install rabbitmq bitnami/rabbitmq -f values.yaml --version 8.24.12
```

## 水平扩缩容

- [Scale The Cluster Horizontally](https://docs.bitnami.com/kubernetes/infrastructure/rabbitmq/administration/scale-deployment/)

如果执行了 `rabbitmqctl forget_cluster_node ${node}` 必须删除对应 vpc 否则会导致再次扩容失败。
