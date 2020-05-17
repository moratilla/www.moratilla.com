---
layout: page
title: Install Kubernetes Ingress
published: true
---

## INGRESS-NGINX

1. Check documentation

* https://kubernetes.github.io/ingress-nginx/deploy/#bare-metal
* https://kubernetes.github.io/ingress-nginx/deploy/baremetal/

2. Install on Bare Metal (using a NodePort)

  ```
  kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-0.32.0/deploy/static/provider/baremetal/deploy.yaml
  ```

2.1. Verify Installation

  ```
  kubectl get pods -n ingress-nginx -l app.kubernetes.io/name=ingress-nginx --watch
  ```

3. Install using Helm

  ```
  helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
  helm install my-release ingress-nginx/ingress-nginx
  ```

3.1. Verify installation

  ```
  kubectl get pods -n ingress-nginx -l app.kubernetes.io/name=ingress-nginx --watch
  ```


4. Detect installed version

  ```
  POD_NAME=$(kubectl get pods -A -l app.kubernetes.io/name=ingress-nginx,app.kubernetes.io/component=controller -o jsonpath='{.items[0].metadata.name}')
  kubectl exec -n ingress-nginx -it $POD_NAME -- /nginx-ingress-controller --version
  ```

5. Consider using MetalLB as software LoadBalancer for your kubernetes LoadBalancer services

* Documentation: https://metallb.universe.tf/

## Defining an Ingress Service

This is a manifest for a website.  It will map the host 'test.moratilla.com' with the internal service www-moratilla-com-website, running in a ClusterIP in port 80.


  ```
  apiVersion: networking.k8s.io/v1beta1
  kind: Ingress
  metadata:
    name: web-moratilla-com
    annotations:
      kubernetes.io/ingress.class: nginx
  spec:
    rules:
      - host: test.moratilla.com
        http:
          paths:
          - path: /
            backend:
              serviceName: www-moratilla-com-website
              servicePort: 80
  ```

To access the resource, you must point to the high port of the ingress-nginx NodePort service.  You can access to it using the kubectl get svc -n ingress-nginx command:

  ```
  kubectl get svc --namespace ingress-nginx
  NAME                                 TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)                      AGE
  ingress-nginx-controller             NodePort    10.109.156.99   <none>        80:32251/TCP,443:32766/TCP   7h59m
  ingress-nginx-controller-admission   ClusterIP   10.97.8.28      <none>        443/TCP                      7h59m
  ```

  The port to use for a HTTP connection is the 32251.

  ```
  curl http://test.moratilla.com:32251/
  ```

