## GOA register 服务

注册中心

### 安装

使用 `helm` 安装

```
helm repo add dragonest http://harbor.ops.ilongyuan.cn/chartrepo/charts --username <USERNAME> --password <PASSWORD>
helm repo update
helm install goa-register dragonest/goa-register -f <VALUES_FILE>
```

### 配置

#### 参数

| 参数名                            | 描述                                | 默认值                                                                               |
| --------------------------------- | ----------------------------------- | ------------------------------------------------------------------------------------ |
| image.repository                  | 镜像仓库                            | `lyrelease-registry.cn-shanghai.cr.aliyuncs.com/ly_release/goa-register`             |
| image.tag                         | 镜像版本                            | `IMAGE_VERSION`                                                                      |
| image.pullPolicy                  | 镜像拉取策略                        | `IfNotPresent`                                                                       |
| image.pullSecrets                 | 镜像拉取时使用的 secret             | `null`                                                                               |
| replicaCount                      | 副本数量                            | `1`                                                                                  |
| nodeSelector                      | 运行节点                            | `{}`                                                                                 |
| resources                         | 资源限制                            | `{}`                                                                                 |
| secret.db_host                    | Mysql 地址                          |                                                                                      |
| secret.db_port                    | Mysql 端口                          | `3306`                                                                               |
| secret.db_username                | Mysql 用户名                        |                                                                                      |
| secret.db_password                | Mysql 密码                          |                                                                                      |
| secret.db_database                | Mysql 数据库                        | `goa-register`                                                                       |
| secret.redis_host                 | Redis 地址                          |                                                                                      |
| secret.redis_port                 | Redis 端口                          | `6379`                                                                               |
| secret.redis_auth                 | Redis 密码                          |                                                                                      |
| secret.redis_db                   | Redis 数据库                        | `2`                                                                                  |
| secret.zipkin_endpoint_url        | ZIPKIN 地址                         |                                                                                      |
| secret.rabbitmq_host              | RabbitMQ 地址                       |                                                                                      |
| secret.rabbitmq_port              | RabbitMQ 端口                       | `15672`                                                                              |
| secret.rabbitmq_scheme            | RabbitMQ Scheme                     | `http`                                                                               |
| secret.rabbitmq_user              | RabbitMQ 用户名                     |                                                                                      |
| secret.rabbitmq_password          | RabbitMQ 密码                       |                                                                                      |
| secret.gm_host                    | GM 地址                             |                                                                                      |
| secret.gm_game_ids                | GM GameIDs                          |                                                                                      |
| secret.gm_report_auth_header_keys |                                     |                                                                                      |
| secret.gm_auth_header_key         |                                     |                                                                                      |
| secret.http_server_host           |                                     |                                                                                      |
| secret.state_center_host          |                                     |                                                                                      |
| secret.always_activity_id         |                                     |                                                                                      |
| secret.always_activity_secret     |                                     |                                                                                      |
| secret.cyclic_activity_id         |                                     |                                                                                      |
| secret.cyclic_activity_secret     |                                     |                                                                                      |
| secret.gatway_host                | GOA 网关地址                        |                                                                                      |
| secret.activity_push_event        |                                     |                                                                                      |
| secret.receive_event              |                                     |                                                                                      |
| secret.goa_appid                  | GOA appid                           |                                                                                      |
| secret.goa_secret                 | GOA secret                          |                                                                                      |
