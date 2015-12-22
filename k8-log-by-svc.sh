#!/bin/bash

#this script will stream the logs for each pod running a given service
#(in other words, if the pod name starts with the string given)
# equivalent to doing a kubectl get pod followed by kubectl logs -f [podname] 

# usage
# ./k8-log-by-svc.sh  YOUR_SVC_NAME


number_of_pods=$(kubectl get pod|grep $1|wc -l)
if [ ${number_of_pods} -gt 1 ]; then
	vertical=300
	for pod in $(kubectl get pod|grep $1| awk '{print $1;}' )
	do  
		let "vertical+=50"
		cmd="kubectl logs -f ${pod}"
		x-terminal-emulator --new-tab --title=${pod} --geometry=900x450+100+${vertical} -x ${cmd} &
	done
else
	kubectl logs -f $(kubectl get pod|grep $1| awk '{print $1;}')
fi