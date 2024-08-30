
helmAppName ?= kuboard1 #
NS ?= hwx1166232

template:
	rm -rf outdir-${helmAppName}
	helm template kuboard-helm/ --namespace ${NS} --values ./values.yaml --name-template ${helmAppName} --output-dir outdir-${helmAppName}

install:
	helm install ${helmAppName} ./kuboard-helm --values ./values.yaml --namespace ${NS} 

uninstall:
	helm uninstall ${helmAppName} --namespace ${NS} 

get:
	-kubectl get statefulset -n ${NS} |grep kuboard
	-kubectl get po -n ${NS} |grep kuboard

