
<br>

### Welcome !

In this scenario, we'll play with open-telemetry in the Kubernetes cluster.
you need to click on start.

It can take few minutes , as it will be configuring in background.

**ENJOY!**

Add OpenTelemetry Helm repository:
```
helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
```{{exec}}

To install the chart with the release name my-otel-demo, run the following command:
```
helm install my-otel-demo open-telemetry/opentelemetry-demo \
            --set components.shipping.enabled=false \
            --set components.fraud-detection.enabled=false \
            --set opensearch.enabled=false

```{{exec}}


```
helm list

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
  echo "Waiting for ${INTERVAL} seconds..."
  sleep "$INTERVAL"
done
```{{exec}}

```
kubectl  expose pod $(kubectl  get pod -l app.kubernetes.io/name=frontend-proxy -o jsonpath='{.items[*].metadata.name}') --type=NodePort --name=frontEndport --target-port=8080 --port=8080

```{{exec}}