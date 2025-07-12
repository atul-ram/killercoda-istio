echo "Deploying scenario..." && sleep 50


kubectl wait --for=condition=ready  pod --all -n default

kubectl get pod -n default

kubectl get svc -n default

echo "Scenario deployed successfully."

