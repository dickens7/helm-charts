# 安装 etcd

- [bitnami-etcd](https://artifacthub.io/packages/helm/bitnami/etcd)

```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install etcd bitnami/etcd -f values.yaml --version 8.1.1
```

## 水平扩缩容

### 缩容

- 节点缩容之后，需要等待一段时间之后再执行扩容操作。 确保已经被移除 member list， 并且已经选举出 leader， 否则会导致集群扩缩容失败。
- 缩容后一定要删除对应的 pv， 否则下次再扩容时可能会导致扩容失败。 `Error: etcdserver: member not found`

### 扩容

- 扩容时新增加节点数，必须小于等于当前节点数, 否则将导致扩容失败。 etcd 无法选举出 leader
