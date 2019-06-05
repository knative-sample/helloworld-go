#!/bin/bash

SVC_NAME="helloworld-go"

export INGRESSGATEWAY=istio-ingressgateway
export IP_ADDRESS=$(kubectl get svc $INGRESSGATEWAY --namespace istio-system --output jsonpath="{.status.loadBalancer.ingress[*]['ip']}")
echo "IP_ADDRESS: ${IP_ADDRESS}"

export GATEWAY_IP=`kubectl get svc $INGRESSGATEWAY --namespace istio-system --output jsonpath="{.status.loadBalancer.ingress[*]['ip']}"`
export DOMAIN_NAME=`kubectl get route ${SVC_NAME} --output jsonpath="{.status.domain}"`

kubectl get ksvc ${SVC_NAME} --output=custom-columns=NAME:.metadata.name,DOMAIN:.status.domain

time curl -H "Host: ${DOMAIN_NAME}" http://${IP_ADDRESS} -v
