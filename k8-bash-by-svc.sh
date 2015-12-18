#!/bin/bash


#this script will opena bash shell for each pod running a given service
#(in other words, if the pod name starts with the string given)
# equivalent to doing a kubectl get pod followed by kubectl exec -it [podname] bash

# usage
# ./k8-bash-by-svc.sh  YOUR_SVC_NAME



for pod in $(kubectl get pod|grep $1| awk '{print $1;}' )
do  
	cmd="kubectl exec -it ${pod} bash"
	echo $cmd
	x-terminal-emulator --new-tab --title=${pod} --geometry=900x450 -x ${cmd} &
done