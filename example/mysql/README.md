# 安装 MySQL

> 仅用于开发测试， 请勿使用在生产环境使用

- [bitnami-mysql](https://artifacthub.io/packages/helm/bitnami/mysql)

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install mysql bitnami/mysql -f values.yaml --version 8.8.16
```
