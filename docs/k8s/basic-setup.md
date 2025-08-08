### System Prerequisites

> Disable swap

```fish
sudo swapoff -a
```

> Disable from fstab line with swap partition, `add # at start`

```fish
sudo sed -i '/ swap / s/^/#/' /etc/fstab
```

> Configure kernel modules and networking

```fish
cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

sudo sysctl --system
```

### Install containerd (Ubuntu)

- https://docs.docker.com/engine/install/ubuntu
- follow steps in docs and install it

```fish
sudo apt-get install containerd.io
```

> generate default containerd config, open it and [follow these steps](https://kubernetes.io/docs/setup/production-environment/container-runtimes/#containerd)

```fish
sudo mkdir -p /etc/containerd
sudo containerd config default | sudo tee /etc/containerd/config.toml

vim /etc/containerd/config.toml
```

### Install kubeadm, kubelet and kubectl

- [follow these steps](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/#installing-kubeadm-kubelet-and-kubectl)
- after that run this to configure kubectl for user

```fish
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

> [!WARNING] Wait!
> all those steps before, you need to do also for worker nodes

### Install cilium cli

- [follow these steps](https://docs.cilium.io/en/stable/gettingstarted/k8s-install-default/#install-the-cilium-cli)
- after that, install cilium and wait for status validation

```fish
cilium install

cilium status --wait
```

### Finally, init cluster

```fish
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --skip-phases=addon/kube-proxy
```

> it will print something like this, copy it, you should use it in all worker nodes later

```fish
kubekubeadm join 161.35.74.216:6443 --token pj9y3z.jbshwo9v4xm1gvf7 \
	--discovery-token-ca-cert-hash sha256:698dd9b79d6a966d052eeb70ec6443778affeb1a541dda83231cfd2907e3be94
```

### Check if k8s master node correctly configured

```fish
nc 127.0.0.1 6443 -zv -w 2

kubectl get pods -A
```

- first command should print something like
- `Connection to 127.0.0.1 6443 port [tcp/*] succeeded!`
- for second one everything should be in `Running` status

![](./assets/k8s-setup-ok.png)
