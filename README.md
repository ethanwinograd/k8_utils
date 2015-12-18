# k8_utils
helpers for working with kubernetes



## k8-log-by-svc.sh
This guy allows you to see the logs for a pod by giving the service name.  Useful when your podnames keep changing. It opens a new default terminal window in the case of multiple matches.

usage : 
``$./k8-log-by-svc.sh my_service``


## k8-bash-by-svc.sh
This guy opens a bash shell for a pod by giving the service name.  Useful when your podnames keep changing. It opens a new default terminal window in the case of multiple matches.
usage : 
``$./k8-bash-by-svc.sh my_service``