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
Para realizar o deploy da aplicação utilize ```make apply``` e toda a estrutura será provisionada em um cluster eks, já coletando as metricas 
do cluster com o exporter do ```prometheus``` e ```grafana``` como serviço de monitoramento.
para remover toda a infra da aplicação , use ``` make destroy```


### Grafana dashboard com metricas do cluster

No seu terminal irá aparecer seu usuário e senha temporários.
Use-os para acessar o dashboard:
```
Browse to http://127.0.0.1:8080
```



