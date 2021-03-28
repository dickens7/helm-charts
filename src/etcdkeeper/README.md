# Etcdkeeper

## 安装

使用 `helm` 安装

```
helm dependency update
helm install -n apisix etcdkeeper .
```

### 配置

#### 参数

| 参数名                            | 描述                                | 默认值                                                                               |
| --------------------------------- | ----------------------------------- | ------------------------------------------------------------------------------------ |
| image.repository                  | 镜像仓库                            | `evildecay/etcdkeeper`            |
| image.tag                         | 镜像版本                            | `v0.7.6`                                                                      |
| image.pullPolicy                  | 镜像拉取策略                         | `Always`                                                                    |
| image.pullSecrets                 | 镜像拉取时使用的 secret              | `null`                                                                       |
| replicaCount                      | 副本数量                            | `1`                                                                        |
| nodeSelector                      | 运行节点                            | `{}`                                                                                 |
| resources                         | 资源限制                            | `{}`                                                                                 |