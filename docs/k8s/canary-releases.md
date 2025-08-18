#### Use private images from self-hosted docker registry

```fish
kubectl create secret docker-registry dockerhub \
  --docker-server=https://docker.example.com \
  --docker-username=readonly_user \
  --docker-password=lalala1234 \
```

#### Use that secret for all pods in the default namespace to download private images

```fish
kubectl patch serviceaccount default \
  -n default \
  -p '{"imagePullSecrets": [{"name": "dockerhub"}]}'
```

#### Create secret for apps from .env file

```fish
kubectl create secret generic frontend-secret --from-env-file=.env
```

#### need to paste `EXTERNAL-IP` of `nginx-ingress-controller` to DNS with type A

```fish
kubectl get svc -n ingress-nginx
```

### Configure TLS cert-manager

[install cert-manager with helm](https://cert-manager.io/docs/installation/helm/)

### Canary releases

- [setup flagger](https://docs.flagger.app/install/flagger-install-on-kubernetes)

> then

- [setup with ingress nginx](https://docs.flagger.app/tutorials/nginx-progressive-delivery)
