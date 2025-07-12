#!/bin/bash
echo "Deploying scenario..." && sleep 1

kubectl create ns otel-demo

# Deploy the scenario using the provided script
helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts

helm install my-otel-demo open-telemetry/opentelemetry-demo

echo "Scenario deployed successfully."

