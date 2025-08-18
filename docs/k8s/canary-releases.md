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

#### need to paste `EXTERNAL-IP` of `nginx-ingress-controller` to DNS with type A

```fish
kubectl get svc -n ingress-nginx
```

### Canary releases

- [setup flagger](https://docs.flagger.app/install/flagger-install-on-kubernetes)

> then

- [setup with ingress nginx](https://docs.flagger.app/tutorials/nginx-progressive-delivery)
