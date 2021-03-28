.PHONY : build
build:
	cd docs && helm package ../src/$(targetDir) && helm repo index --url https://dickens7.github.io/helm-charts/ .