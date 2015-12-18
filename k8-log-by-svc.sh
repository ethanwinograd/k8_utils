#!/bin/bash

#this script will stream the logs for each pod running a given service
#(in other words, if the pod name starts with the string given)
# equivalent to doing a kubectl get pod followed by kubectl logs -f [podname] 

# usage
# ./k8-log-by-svc.sh  YOUR_SVC_NAME


for pod in $(kubectl get pod|grep $1| awk '{print $1;}' )
do  
	cmd="kubectl logs -f ${pod}"
	echo $cmd
	x-terminal-emulator --new-tab --title=${pod} --geometry=900x450 -x ${cmd} &
done