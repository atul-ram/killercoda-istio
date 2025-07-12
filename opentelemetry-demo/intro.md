
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

helm install my-otel-demo charts/opentelemetry-demo \
    --namespace opentelemetry-demo \
    --set serviceAccount.create=false \
    --set serviceAccount.name=opentelemetry-demo \
    --set prometheus.rbac.create=false \
    --set prometheus.serviceAccounts.server.create=false \
    --set prometheus.serviceAccounts.server.name=opentelemetry-demo \
    --set grafana.rbac.create=false \
    --set grafana.serviceAccount.create=false \
    --set grafana.serviceAccount.name=opentelemetry-demo

kubectl  expose pod $(kubectl  get pod -l app.kubernetes.io/name=frontend-proxy -o jsonpath='{.items[*].metadata.name}') --type=NodePort --name=frontendport --target-port=8080 --port=8080

```{{exec}}

```
kubectl get pod | grep -v "unning" | wc -l 

```{{exec}}


```
COMMAND="kubectl get pod | grep -v 'Running' | wc -l"

# Define the interval in seconds
INTERVAL=20

echo "--- Script to count non-running pods started ---"
echo "Running command every ${INTERVAL} seconds. Press Ctrl+C to stop."
echo "Command: ${COMMAND}"
echo "-------------------------------------------------"

while true; do
  echo "--- Non-running pod count at $(date) ---"
  eval "$COMMAND"
  echo "-------------------------------------------------"
  echo "Waiting for ${INTERVAL} seconds..."
  sleep "$INTERVAL"
done
```{{exec}}

```
kubectl  expose pod $(kubectl  get pod -l app.kubernetes.io/name=frontend-proxy -o jsonpath='{.items[*].metadata.name}') --type=NodePort --name=frontEndport --target-port=8080 --port=8080

```{{exec}}