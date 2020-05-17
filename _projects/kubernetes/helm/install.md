---
layout: page
title: Install Helm
published: true
---

## Install helm locally using asdf-vm

1. Use [asdf-vm](https://asdf-vm.com)

  ```
  asdf plugin add helm
  asdf list all helm
  asdf install helm 3.2.0
  echo "helm 3.2.0" >> ~/.tool-versions
  ```

2. Add a repo

  ```
  helm repo list
  helm repo add stable https://kubernetes-charts.storage.googleapis.com/
  helm repo update
  helm search repo stable
  ```

3. Install a chart

  ```
  helm install stable/mysql
  ```



