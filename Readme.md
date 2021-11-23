## Cluster Aks 

1. terraform apply  -auto-approve, creara un cluster de un nodo
2. tambien se encuentra una aplicacion dummy para probar el cluster
3. Para desplegar la aplicacion se debe ejecutar "kubectl apply -f azure-vote.yaml"
4. Revisar los servicios expuestos por k8s "kubectl get service"
5. Visuzalizar la ip externa del front "kubectl get service azure-vote-front --watch"
6. Ver Pods corriendo "kubectl get pods"
