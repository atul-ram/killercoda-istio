
<br>

### Welcome !

In this scenario, we'll play with open-telemetry in the Kubernetes cluster.
you need to click on start.

It can take few minutes , as it will be configuring in background.

**ENJOY!**
```

kubectl create ns otel-demo

# Deploy the scenario using the provided script
helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts

helm install my-otel-demo open-telemetry/opentelemetry-demo

kubectl  expose pod $(kubectl  get pod -l app.kubernetes.io/name=frontend-proxy -o jsonpath='{.items[*].metadata.name}') --type=NodePort --name=frontEndport --target-port=8080 --port=8080

```{{exec}}

```
kubectl  get pod

```{{exec}}

```
kubectl  expose pod $(kubectl  get pod -l app.kubernetes.io/name=frontend-proxy -o jsonpath='{.items[*].metadata.name}') --type=NodePort --name=frontEndport --target-port=8080 --port=8080

```{{exec}}