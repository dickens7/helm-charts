# 安装 prometheus operator

- 部署 prometheus operator

```bash
LATEST=$(curl -s https://api.github.com/repos/prometheus-operator/prometheus-operator/releases/latest | jq -cr .tag_name)
curl -sL https://github.com/prometheus-operator/prometheus-operator/releases/download/${LATEST}/bundle.yaml | kubectl create -f -
```

- The CustomResourceDefinition "prometheuses.monitoring.coreos.com" is invalid: metadata.annotations: Too long: must have at most 262144 bytes

> 不能使用 kubectlapply 时提示 annotations 过长,需要使用 kubectl create 代替

```bash
kubectl create -f
```

- 安装 prometheus

```bash
kubectl apply -f 
```
