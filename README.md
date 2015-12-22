# k8_utils
helpers for working with kubernetes


## k8r2me.sh  Cater To Me
This guy allows you to see the logs or open a bash shell for a pod by giving the service name.  Useful when your podnames keep changing. It opens a new default terminal window in the case of multiple matches.

usage : 
``$./k8r2me.sh bash my_service``
``$./k8r2me.sh logs my_service``


These guys below are the original scripts -- there really is no need for them now that k8r2me exiusts.


## k8-log-by-svc.sh
This guy allows you to see the logs for a pod by giving the service name.  Useful when your podnames keep changing. It opens a new default terminal window in the case of multiple matches.

usage : 
``$./k8-log-by-svc.sh my_service``


## k8-bash-by-svc.sh
This guy opens a bash shell for a pod by giving the service name.  Useful when your podnames keep changing. It opens a new default terminal window in the case of multiple matches.
usage : 
``$./k8-bash-by-svc.sh my_service``