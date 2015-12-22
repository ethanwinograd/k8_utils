#!/bin/bash


#this script will opena bash shell for each pod running a given service
#(in other words, if the pod name starts with the string given)
# equivalent to doing a kubectl get pod followed by kubectl exec -it [podname] bash

# usage
# ./k8-bash-by-svc.sh  YOUR_SVC_NAME


number_of_pods=$(kubectl get pod|grep $1|wc -l)
if [ ${number_of_pods} -gt 1 ]; then
	vertical=300
	for pod in $(kubectl get pod|grep $1| awk '{print $1;}' )
	do  
		let "vertical+=50"
		cmd="kubectl exec -it ${pod} bash"
		x-terminal-emulator --new-tab --title=${pod} --geometry=900x450+100+${vertical} -x ${cmd} &
	done
else
	kubectl exec -it $(kubectl get pod|grep $1| awk '{print $1;}') bash
fi