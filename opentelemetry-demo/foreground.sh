echo "Deploying scenario..." && sleep 1


# This script is used to download the OpenTelemetry demo YAML file.
wget -O opentelemetry-demo.yaml https://raw.githubusercontent.com/open-telemetry/opentelemetry-demo/refs/heads/main/kubernetes/opentelemetry-demo.yaml
if [ $? -ne 0 ]; then
    echo "Failed to download OpenTelemetry demo YAML file."
    exit 1
else
    echo "OpenTelemetry demo YAML file downloaded successfully."
fi

# Apply the OpenTelemetry demo YAML file to the Kubernetes cluster.
kubectl apply -f opentelemetry-demo.yaml

kubectl wait --for=condition=ready  --timeout=80s pod --all -A

echo "Scenario deployed successfully."

