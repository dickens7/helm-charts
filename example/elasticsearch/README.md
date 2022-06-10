# 安装 elasticsearch

```bash
helm repo add elastic https://helm.elastic.co

helm repo update

helm install elasticsearch elastic/elasticsearch -f values.yaml --version 7.17.3
```
