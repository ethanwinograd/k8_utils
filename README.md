# k8_utils
helpers for working with kubernetes


## k8r2me.sh  Cater To Me
This guy allows you to see the logs or open a bash shell for a pod by giving the service name.  Useful when your podnames keep changing. It opens a new default terminal window in the case of multiple matches.

##usage : 
``$./k8r2me.sh bash my_service``


``$./k8r2me.sh logs my_service``



## requirements
kubectl
https://cloud.google.com/container-engine/docs/kubectl/

## install
 ``$sudo chmod 0755 ~/k8_utils/k8r2me.sh``


 ``$sudo ln -s ~/k8_utils/k8r2me.sh /usr/bin/k8r2me.sh``



