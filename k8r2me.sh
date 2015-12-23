#!/bin/bash


function usage(){
	echo "usage : 'k8r2me bash myservice' or 'k8r2me logs myservice'"
}

#arg1 is podname
function k8_logs_cmd(){
	kubectl logs -f $1
}

#arg1 is podname
function k8_bash_cmd(){
	kubectl exec -it $1 bash	
}


function validate(){
	if [ "${task}" !=  "bash" ] && [ "${task}" !=  "logs" ]; then
		usage
		exit
	fi

	if [ -z "$svc_name" ]; then
		usage
		exit
	fi
}

task=$1
svc_name=$2

validate
number_of_pods=$(kubectl get pod|grep $svc_name|wc -l)
if [ ${number_of_pods} -gt 1 ]; then
	#spawn new terminals
	vertical=300
	horizontal=100
	for pod in $(kubectl get pod|grep $svc_name| awk '{print $1;}' )
	do  
		let "vertical+=150"
		let "horizontal+=150"
		if [ "${task}" =  "bash" ]; then
			x-terminal-emulator --new-tab --title=${pod} --geometry=900x450+${horizontal}+${vertical} -x kubectl exec -it ${pod} bash &
		else
			x-terminal-emulator --new-tab --title=${pod} --geometry=900x450+${horizontal}+${vertical} -x kubectl logs -f ${pod} &
		fi		
	done
else
	#use this terminal
	pod=$(kubectl get pod|grep ${svc_name}| awk '{print $1;}' )
	if [ "${task}" = "bash" ]; then
		k8_bash_cmd ${pod}
	else
		k8_logs_cmd ${pod}
	fi	
fi