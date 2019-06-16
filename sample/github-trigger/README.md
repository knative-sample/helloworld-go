
## 执行步骤
- 创建 Trigger Service 
  - 创建 clusterrole
     clusterrole.yaml clusterrolebinding.yaml
  - 创建 serviceAccount
     serviceaccount.yaml 
  - 创建 ConfigMap 
    configmap.yaml
  - 创建 service 
    service.yaml 
- 创建 github source
  - 创建 secret
    参考[文档](https://github.com/knative/docs/blob/master/docs/eventing/samples/github-source/README.md#create-github-tokens)获取 github token
    githubsource-secret.yaml
  - 创建 source 
    github-source.yaml
##  执行命令

```
kubectl apply -f egress.yaml
kubectl apply -f clusterrole.yaml
kubectl apply -f clusterrolebinding.yaml
kubectl apply -f serviceaccount.yaml
kubectl apply -f configmap.yaml
kubectl apply -f service.yaml

kubectl apply -f githubsource-secret.yaml
kubectl apply -f github-source.yaml
```
