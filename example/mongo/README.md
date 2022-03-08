# 安装 MongoDB

> 仅用于开发测试， 请勿使用在生产环境使用

- [bitnami-mongodb](https://artifacthub.io/packages/helm/bitnami/mongodb)

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install mongodb bitnami/mongodb -f values.yaml --version 10.30.6
```
