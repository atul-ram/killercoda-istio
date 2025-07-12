#!/bin/bash

kubectl create ns otel-demo

# Deploy the scenario using the provided script
helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts

helm install my-otel-demo open-telemetry/opentelemetry-demo
