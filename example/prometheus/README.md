# sdfa

```shell
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm repo update

helm install prometheus -n monitoring prometheus-community/prometheus --version 15.5.3 --create-namespace 
```
