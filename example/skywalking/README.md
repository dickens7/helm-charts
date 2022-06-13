# 安装 skywalking

```bash
helm repo add skywalking https://apache.jfrog.io/artifactory/skywalking-helm                                

helm repo update

helm install skywalking skywalking/skywalking -n skywalking -f values.yaml 
```
