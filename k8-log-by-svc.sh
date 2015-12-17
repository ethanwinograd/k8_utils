#!/bin/bash

kubectl logs -f $(kubectl get po|grep $1 | awk '{print $1;}')