k3d cluster create helm-example --api-port 127.0.0.1:6445 --servers 3 --agents 0 --k3s-arg "--disable=traefik@server:*" --k3s-node-label 'dickens7-helm=example@all' --port '9080:80@loadbalancer' \
 --port '9443:443@server:0' --wait


# --registry-config "/home/seven/code/github.com/dickens7/helm-charts/example/k3d/registries.yaml" --wait



k3d cluster create foo --agents 1 \
    --k3s-arg "--disable=servicelb" --k3s-arg "--disable=traefik"  --no-lb \
    --k3s-arg "--disable-network-policy" --k3s-arg "--flannel-backend=none" 





  docker exec -it k3d-testcluster-agent-0 mount bpffs /sys/fs/bpf -t bpf
  docker exec -it k3d-testcluster-agent-0 mount --make-shared /sys/fs/bpf
  docker exec -it k3d-testcluster-agent-0 mkdir -p /run/cilium/cgroupv2
  docker exec -it k3d-testcluster-agent-0 mount none /run/cilium/cgroupv2 -t cgroup2
  docker exec -it k3d-testcluster-agent-0 mount --make-shared /run/cilium/cgroupv2/


 mount bpffs /sys/fs/bpf -t bpf && mount --make-shared /sys/fs/bpf && mkdir -p /run/cilium/cgroupv2
 
 mount none /run/cilium/cgroupv2 -t cgroup2 && mount --make-shared /run/cilium/cgroupv2/



  helm upgrade --install cilium cilium/cilium \
   --namespace cilium \
   --set prometheus.enabled=true \
   --set operator.prometheus.enabled=true \
   --set hubble.enabled=true \
   --set hubble.metrics.enabled="{dns,drop,tcp,flow,port-distribution,icmp,http}" \
   --set hubble.relay.enabled=true \
   --set hubble.ui.enabled=true