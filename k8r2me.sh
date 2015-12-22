#!/bin/bash


task=$1
svc_name=$2

#arg1 is podname
function k8_logs_cmd(){
	kubectl logs -f $1
}

#arg1 is podname
function k8_bash_cmd(){
	kubectl exec -it $1 bash	
}


number_of_pods=$(kubectl get pod|grep $svc_name|wc -l)
if [ ${number_of_pods} -gt 1 ]; then
	#spawn new terminals
	vertical=300
	#kubectl get pod|grep $svc_name| awk '{print $1;}'
	for pod in $(kubectl get pod|grep $svc_name| awk '{print $1;}' )
	do  
		#echo ${pod}
		let "vertical+=50"
		#cmd="kubectl logs -f ${pod}"
		#x-terminal-emulator --new-tab --title=${pod} --geometry=900x450+100+${vertical} -x ${cmd} &
		if [ "${task}" =  "bash" ]; then
			echo ${task}
			x-terminal-emulator --new-tab --title=${pod} --geometry=900x450+100+${vertical} -x kubectl exec -it ${pod} bash &
		else
			x-terminal-emulator --new-tab --title=${pod} --geometry=900x450+100+${vertical} -x kubectl logs -f ${pod} &
		fi		
	done
else
	#use this terminal
	pod=$(kubectl get pod|grep ${svc_name}| awk '{print $1;}' )
	if [ "${task}" = "bash" ]; then
		echo ${task}
		k8_bash_cmd ${pod}
	else
		k8_logs_cmd ${pod}
	fi	
fi