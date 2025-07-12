
<br>

### Welcome !

In this scenario, we'll play with open-telemetry in the Kubernetes cluster.
you need to click on start.
It can take few minutes , as it will be configuring in background.

**ENJOY!**
```
kubectl  expose pod $(kubectl  get pod -l app.kubernetes.io/name=frontend-proxy -o jsonpath='{.items[*].metadata.name}') --type=NodePort --name=frontEndport --target-port=8080 --port=8080

```{{exec}}