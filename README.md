# K8s-Monitoring with Prometheus and Grafana
## Requisitos:
| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| aws Cli | >= 3.13, < 4.0 |
| helm | >= 1.0, < 3.0 |
| kubernetes | >= 1.10.0, < 3.0.0 |
| make | >= 4.2.1 |

### Execução da aplicação:
Através de um arquivo makefile no projeto facilita a execução do projeto, então caso queira
fazer um plano de execução utilize o comando ```make plan``` Sendo iniciada todas as dependências
do projeto e em seguida o planejamento do projeto.
Para realizar o deploy da aplicação utilize ```make apply``` e toda a estrutura será provisionada em um cluster eks, 
já coletando as metricas do cluster com o exporter do ```prometheus``` e ```grafana``` como serviço de monitoramento.
```(O serviço do grafana estará rodando no final da execução)```
para remover toda a infra da aplicação , use ``` make destroy```

---

----
### Visualisar as metricas do Prometheus:
Rode o comando abaixo para pegar informação do seu namespace

```
kubectl get all -n terraform-prom-graf-namespace
```
Em seguida use o endpoit abaixo para acessar os targets do prometheus no seu browser
```
{External-ip}:9090/targets
```

<img src="/images/prom.png" >


---

### Grafana dashboard com metricas do cluster

No seu terminal irá aparecer seu usuário e senha temporários.
Use-os para acessar o dashboard:
```
Browse to http://127.0.0.1:8080 ou http://localhost:8080
```
Use a senha e usuário informados no terminal para acessar o Grafana


caso queira gerar uma nova senha para o grafana:
```
echo "GET YOUR PASSWORD HERE: $(kubectl get secret my-release-grafana-admin --namespace default -o jsonpath="{.data.GF_SECURITY_ADMIN_PASSWORD}" | base64 --decode)"
```

<img src="/images/graf.png" >