# Apisix

## 安装

使用 `helm` 安装

```
helm dependency update
helm install -n apisix apisix .
```

### 配置

#### 参数

| 参数名                            | 描述                                | 默认值                                                                               |
| --------------------------------- | ----------------------------------- | ------------------------------------------------------------------------------------ |
| image.repository                  | 镜像仓库                            | `dickens7/apisix`            |
| image.tag                         | 镜像版本                            | `2.1`                                                                      |
| image.pullPolicy                  | 镜像拉取策略                         | `Always`                                                                    |
| image.pullSecrets                 | 镜像拉取时使用的 secret              | `null`                                                                       |
| replicaCount                      | 副本数量                            | `1`                                                                        |
| gateway.ingress.host              | ingress 访问地址                    |                                                                            
| gateway.ingress.annotations       | ingress 注释                        | `{}`                                                                                 |
| gateway.ingress.tls               | 是否开启 ingress 的 tls             | `false`                                                                              |
| nodeSelector                      | 运行节点                            | `{}`                                                                                 |
| resources                         | 资源限制                            | `{}`                                                                                 |
| etcd.enabled                      | 启动 ETCD                              | `true`     |
| etcdkeeper.enabled                | 启动 etcdkeeper                        | `true`                                                                     |