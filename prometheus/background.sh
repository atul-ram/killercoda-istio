helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm repo update

helm install prometheus prometheus-community/kube-prometheus-stack \
    --set crds.upgrade=true \
    --set prometheus.service.type=NodePort \
    --set grafana.adminPassword=a \
    --set grafana.adminUser=a

sleep 2;

kubectl wait --for=condition=ready  --timeout=80s pod --all -n default

kubectl patch svc prometheus-grafana -p '{"spec": {"type": "NodePort", "ports": [{"port": 80, "nodePort": 30000}]}}'


#  --set prometheus.prometheusSpec.serviceMonitorSelectorNilUsesHelmValues=false \
#  --set prometheus.prometheusSpec.serviceMonitorSelector.matchExpressions[0].key=k8s-app \
#  --set prometheus.prometheusSpec.serviceMonitorSelector.matchExpressions[0].operator=Exists \
#  --set prometheus.prometheusSpec.serviceMonitorSelector.matchExpressions[0].values[0]=kube-prometheus-stack-prometheus-node-exporter

#prometheus -f https://raw.githubusercontent.com/chadmcrowell/k8s/main/prometheus/values.yaml

# helm install node-exporter prometheus-community/prometheus-node-exporter
# helm install node-exporter prometheus-community/prometheus-node-exporter --set service.targetPort=9101 --set service.port=9101

# sleep 30

# kubectl patch svc prometheus-grafana -p '{"spec": {"type": "NodePort", "ports": [{"port": 80, "nodePort": 30000}]}}'


# cat <<EOF | kubectl apply -f -
# apiVersion: v1
# kind: Service
# metadata:
#   annotations:
#     meta.helm.sh/release-name: prometheus
#     meta.helm.sh/release-namespace: default
#   labels:
#     app.kubernetes.io/component: server
#     app.kubernetes.io/instance: prometheus
#     app.kubernetes.io/managed-by: Helm
#     app.kubernetes.io/name: prometheus
#     app.kubernetes.io/part-of: prometheus
#     app.kubernetes.io/version: v2.53.1
#     helm.sh/chart: prometheus-25.25.0
#   name: prometheus-server
#   namespace: default
# spec:
#   ipFamilies:
#   - IPv4
#   ipFamilyPolicy: SingleStack
#   ports:
#   - name: http
#     nodePort: 30000
#     port: 80
#     protocol: TCP
#     targetPort: 9090
#   selector:
#     app.kubernetes.io/component: server
#     app.kubernetes.io/instance: prometheus
#     app.kubernetes.io/name: prometheus
#   sessionAffinity: None
#   type: NodePort
# EOF
