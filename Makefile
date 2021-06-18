plan:
	cd ./efs/ && terraform init && terraform plan
	cd ..
	cd ./eks_prometheus_exporter/ && terraform init && terraform plan

apply:
	cd ./efs/ && terraform init && terraform apply
	sleep 10
	cd ..
	cd ./eks_prometheus_exporter/ && terraform init && terraform apply
	echo "User: admin"
	echo "GET YOUR PASSWORD HERE: $(kubectl get secret my-release-grafana-admin --namespace default -o jsonpath="{.data.GF_SECURITY_ADMIN_PASSWORD}" | base64 --decode)"
	kubectl port-forward svc/my-release-grafana 8080:3000

destroy:
	cd ./efs/ && terraform destroy
	sleep 10
	cd ..
	cd ./eks_prometheus_exporter/ &&  terraform destroy