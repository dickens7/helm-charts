# Apisix Dashboard

## 安装

使用 `helm` 安装

```
helm dependency update
helm install -n apisix apisix-dashboard .
```

### 配置

- schema 配置


```
apisix:
  ...
  enable_control: true
  control:
    ip: "127.0.0.1"
    port: 9090
```

```
curl 127.0.0.1:9080/v1/shecma > schema.json
```

将 schema.json 放置到当前根目录中与values.yaml同级即可

#### 参数

| 参数名                            | 描述                                | 默认值                                                                               |
| --------------------------------- | ----------------------------------- | ------------------------------------------------------------------------------------ |
| image.repository                  | 镜像仓库                            | `dickens7/apisix-dashboard`            |
| image.tag                         | 镜像版本                            | `2.1`                                                                      |
| image.pullPolicy                  | 镜像拉取策略                         | `Always`                                                                    |
| image.pullSecrets                 | 镜像拉取时使用的 secret              | `null`                                                                       |
| replicaCount                      | 副本数量                            | `1`                                                                        |
| nodeSelector                      | 运行节点                            | `{}`                                                                                 |
| resources                         | 资源限制                            | `{}`                                                                                 |
| conf.etcd.endpoints               | ETCD host                          | `apisix-etcd:2379`     |