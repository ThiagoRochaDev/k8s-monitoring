# K8s-Monitoring with Prometheus and Grafana

### rn this commands in folders to create the cluster and file systems
```
terraform init 
```
```
terraform plan 
```
```
terraform apply 
```
Run this command to create monitoring kube systems in prometheus
```
kubectl apply -f kube-state-metrics-configs/
```
# Creating grafana monitoring

## Run this in your terminal
```
mkdir ${HOME}/

cat << EoF > ${HOME}/grafana.yaml
datasources:
datasources.yaml:
apiVersion: 1
datasources:
- name: Prometheus
type: prometheus
url: http://prometheus-server.prometheus.svc.cluster.local
access: proxy
isDefault: true
EoF
```

```
kubectl create namespace grafana
```
```
helm install grafana grafana/grafana \
--namespace grafana \
--set persistence.storageClassName="gp2" \
--set persistence.enabled=true \
--set adminPassword='EKS!sAWSome' \
--values ${HOME}/environment/grafana/grafana.yaml \
--set service.type=LoadBalancer  
```

### get service
```
kubectl get all -n grafana
```
### get the grafana endpoint
```
export ELB=$(kubectl get svc -n grafana grafana -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')
echo "http://$ELB"
kubectl get secret --namespace grafana grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```