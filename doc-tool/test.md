

## Image parameters

| Parameter | Description |
|--|--|
| image.repository | The docker image repository |
| image.tag | The docker image tag |
| image.pullPolicy | The docker image pull policy |
| image.pullSecrets | The docker image pull secrets |
| version | The version of apisix to deploy |
| podAnnotations | Annotations to add to the apisix pods |
| podSecurityContext | Security context for the apisix pods |
| securityContext | Security context for the apisix containers |


## Gateway parameters

| Parameter | Description |
|--|--|
| gateway.type | apisix replicas service type |
| gateway.http.enable | enable http gateway |
| gateway.http.servicePort | http gateway port |
| gateway.http.containerPort | http gateway container port |
| gateway.http2.enable | enable http2 gateway |
| gateway.http2.servicePort | http2 gateway port |
| gateway.http2.containerPort | http2 gateway container port |
| gateway.tls.enable | enable tcp gateway |
| gateway.tls.servicePort | tcp gateway port |
| gateway.tls.containerPort | tcp gateway container port |
| gateway.tls.http2.enable | enable http2 gateway |
| gateway.stream.enable | enable stream gateway |
| gateway.stream.only | enable stream gateway only |
| gateway.stream.tcp | enable stream gateway tcp |
| gateway.stream.udp | enable stream gateway udp |


## Apisix Config parameters

| Parameter | Description |
|--|--|
| apisixConfig | Apisix config |


## Apisix replicas configuration parameters

| Parameter | Description |
|--|--|
| replicaCount | Number of apisix replicas to deploy |
| resources.request.cpu | The request CPU limit |
| resources.request.memory | The request memory limit |
| resources.limits.cpu | The cpu resource limit |
| resources.limits.memory | The memory resource limit |
| autoscaline.enabled | enable autoscaline |
| autoscaline.minReplicas | min replicas |
| autoscaline.maxReplicas | max replicas |
| autoscaline.targetCPUUtilizationPercentage | target cpu utilization percentage |
| autoscaline.targetMemoryUtilizationPercentage | target memory utilization percentage |
| nodeSelector | Node labels for Apisix master pods assignment |
| tolerations | Tolerations for Apisix; master pods assignment |
| affinity | Affinity for Apisix pods assignment |


## Apisix Dashboard parameters

| Parameter | Description |
|--|--|
| apisix-dashboard.enabled | enable apisix-dashboard |


## Apisix Ingress parameters

| Parameter | Description |
|--|--|
| apisix-ingress-controller.enabled | enable apisix-ingress-controller |


## Etcd parameters

| Parameter | Description |
|--|--|
| etcd.enabled | enable etcd |
