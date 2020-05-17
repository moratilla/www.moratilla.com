---
layout: page
title: Install Prometheus and Grafana
category: project
published: true
---

## Install Prometheus in kuberntes with helm

To install it you need to download the values template first, and modify the parameters to enable / disable the alertmanager, and to set the persistentvolume of the alertmanager and server instances.

  ```
  helm get values stable/prometheus
  ```

For testing purposes, you can go forward without persistenVolumes in server and alertmanager, so just with the helm chart and the modified values.yaml is enough.

  ```
  kubectl create namespace monitoring
  helm upgrade --install --namespace monitoring prometheus stable/prometheus -f values.yaml
  ```


But if you want to deploy to production, use the kube-prometheus. 

  ```
  git clone https://github.com/coreos/kube-prometheus.git
  cd kube-prometheus
  kubectl create -f manifests/setup
  until kubectl get servicemonitors --all-namespaces ; do date; sleep 1; echo ""; done

  NOTE: This command is deceptive, it returns an error, but it is not.  Keep going

  kubectl create -f manifests/
  ```

Access the dashboards:

* Prometheus: 

  ```
  kubectl --namespace monitoring port-forward svc/prometheus-k8s 9090
  ```

* Grafana: 

  ```
  kubectl --namespace monitoring port-forward svc/grafana 3000 (user:password admin:admin)
  ```

* Alert Manager: 

  ```
  kubectl --namespace monitoring port-forward svc/alertmanager-main 9093
  ```




