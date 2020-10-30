## GM2 gateway 服务

统一网关

### 安装

使用 `helm` 安装

```
helm repo add dragonest http://harbor.ops.ilongyuan.cn/chartrepo/charts --username <USERNAME> --password <PASSWORD>
helm repo update
helm installapisix dragonest/apisix -f <VALUES_FILE>
```

### 配置

#### 参数

| 参数名                            | 描述                                | 默认值                                                                               |
| --------------------------------- | ----------------------------------- | ------------------------------------------------------------------------------------ |
| image.repository                  | 镜像仓库                            | `lyrelease-registry.cn-shanghai.cr.aliyuncs.com/ly_release/gm2-generator`            |
| image.tag                         | 镜像版本                            | `IMAGE_VERSION`                                                                      |
| image.pullPolicy                  | 镜像拉取策略                        | `IfNotPresent`                                                                       |
| image.pullSecrets                 | 镜像拉取时使用的 secret             | `null`                                                                               |
| replicaCount                      | 副本数量                            | `1`                                                                                  |
| env                               | 环境变量                            | `[]`                                                                                 |
| readinessProbe                    | readiness 探针                      | `{}`                                                                                 |
| gateway.ingress.host              | ingress 访问地址                    |                                                                                      |
| gateway.ingress.annotations       | ingress 注释                        | `{}`                                                                                 |
| gateway.ingress.tls               | 是否开启 ingress 的 tls             | `false`                                                                              |
| nodeSelector                      | 运行节点                            | `{}`                                                                                 |
| resources                         | 资源限制                            | `{}`                                                                                 |
| etcd.host                         | Etcd 地址                           |                                                                                      |
| etcd.prefix                       | Etcd 前缀                           |                                                                                      |
| etcd.timeout                      | Etcd 超时时间                       | `3`                                                                                  |
