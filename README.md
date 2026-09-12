# Inference-backends

## Usage
### Create a k8s cluster
#### if using k3d:
To be able to reach the ingresses from the local network, create the cluster with port forward.
```
k3d cluster create inference \
  --port "8080:80@loadbalancer" \
  --port "8443:443@loadbalancer"
```

### Apply the infra
```
helmfile sync -e <env>
```
#### vLLM
##### Apple silicon
```
helmfile sync -e apple
```
##### nvidia
```
helmfile sync -e nvidia
```
##### amd
```
helmfile sync -e amd
```
#### Tabby-api (nvidia)
Optimised and preconfigured for qwen3.8-27B on a 4090
```
helmfile sync -e tabbyapi
```

## Call the API
### vLLM
```
curl -v
-H 'Host: vllm.home.arpa'
http://127.0.0.1:8080/v1/models
```

### Tabby-api
```
curl -v
-H 'Host: tabby-api.home.arpa'
http://127.0.0.1:8080/v1/models
```
