#!/bin/bash


#this script will opena bash shell for a pod running a given service
# equivalent to doing a kubectl get pod followed by kubectl exec -it [podname] bash

# usage
# ./k8-bash-by-svc.sh  YOUR_SVC_NAME


kubectl exec -it $(kubectl get pod|grep $1 | awk '{print $1;}') bash
