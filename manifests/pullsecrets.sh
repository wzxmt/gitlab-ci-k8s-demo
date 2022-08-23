#!/bin/bash
cat << EOF |kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  namespace: gitlab
  name: myregistry
type: kubernetes.io/dockerconfigjson
data:
  .dockerconfigjson: $(cat $HOME/.docker/config.json |base64 -w 0)
EOF