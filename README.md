# k8s-monitoring
provisionig eks cluster with prometheus monitoring 


give all acess to your user :
{
"Version": "2012-10-17",
"Statement": [
{
"Sid": "eksadministrator",
"Effect": "Allow",
"Action": "eks:*",
"Resource": "*"
}
]
}