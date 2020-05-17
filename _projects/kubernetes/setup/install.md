---
layout: page
title: Setup Kubernetes
published: true
---

## Install Kubernetes on baremetal

1. instances of 2 Cores and 4GB / 100GB HDD

2. enable SSH

3. update system

  3.1. add universe repository

      echo "deb http://archive.ubuntu.com/ubuntu bionic universe" >> /etc/apt/sources.list

  3.2. update

      apt update
      apt upgrade

  3.3. (proxmox-guest) install the qemu-guest-agent package

      apt-get install -y qemu-guest-agent

  3.4. reboot

      sync
      reboot

4. Let iptables see bridged traffic

  ```
  cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
  net.bridge.bridge-nf-call-ip6tables = 1
  net.bridge.bridge-nf-call-iptables = 1
  EOF
  sudo sysctl --system
  ```

5. Remove swap filesystems

  ```
  swapoff -a
  edit /etc/fstab and comment /swap
  ```

6. Install Docker container runtime

6.1. Install software properties management package

    apt-get update && apt-get install -y \
      apt-transport-https ca-certificates curl software-properties-common gnupg

6.2. Add Docker CE's GPG key
  
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

6.3. Add Docker apt repository

    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"

6.4. Install Docker CE

    apt-get update && apt-get install -y \
      containerd.io=1.2.13-1 \
      docker-ce=5:19.03.8~3-0~ubuntu-$(lsb_release -cs) \
      docker-ce-cli=5:19.03.8~3-0~ubuntu-$(lsb_release -cs)

6.5. Setup the daemon

    cat > /etc/docker/daemon.json <<EOF
    {
        "exec-opts": ["native.cgroupdriver=systemd"],
        "log-driver": "json-file",
        "log-opts": {
          "max-size": "100m"
        },
        "storage-driver": "overlay2"
    }
    EOF

    mkdir -p /etc/systemd/system/docker.service.d

6.6. Restart Docker daemon.

    systemctl daemon-reload
    systemctl restart docker

7. Install kubeadm, kubelet, kubectl

  ```
  sudo apt-get update && sudo apt-get install -y apt-transport-https curl
  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
  cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
  deb https://apt.kubernetes.io/ kubernetes-xenial main
  EOF
  sudo apt-get update
  sudo apt-get install -y kubelet kubeadm kubectl
  sudo apt-mark hold kubelet kubeadm kubectl
  ```

8. Make a snapshot of everything

9. Use Kubeadm to create control plane

9.1. Select the network pod (with Calico)

    kubeadm init --pod-network-cidr=192.168.0.0/16
    kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
  
9.2. Install the calico CLI (calicoctl as kubernetes pod)

    kubectl apply -f https://docs.projectcalico.org/manifests/calicoctl-etcd.yaml
  
9.3. Execute commands with calicoctl

    kubectl exec -ti -n kube-system calicoctl -- /calicoctl get profiles -o wide

10. Use kubeadm to join workers

  ```
  kubeadm join --token <token> <control-plane-host>:<control-plane-port> \ 
    --discovery-token-ca-cert-hash sha256:<hash>
  ```

  Example:
  
  ```
  kubeadm join 10.0.1.65:6443 --token i3bdhm.syft9l74n6b26dr1 \
    --discovery-token-ca-cert-hash \
    sha256:bc9aeca1408b4a1267c605aedb578b43079c1fa22357c5248e47e28b0a6b02b6
  ```


11. Get kubeconfig

  ```
  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
  ```

12. Verify

  ```
  kubectl get nodes -o wide
  ```
