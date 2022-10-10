#!/bin/bash
microdnf install -y curl

TOKEN=$(cat /var/run/secrets/tokens/thanos-token)

PATCH="[{\"op\": \"replace\", \"path\":\"/spec/datasources/0/secureDataJson/httpHeaderValue1\", \"value\": \"Bearer $TOKEN\"}]"


CURLOPTS="-H 'Content-Type: application/json-patch+json' -H 'Authorization: Bearer $TOKEN' -X PATCH --data $PATCH"
NAMESPACE=$(cat /run/secrets/kubernetes.io/serviceaccount/namespace)
PATH="https://kubernetes.default.svc/ais/integreatly.org/v1alpha1/namespaces/$NAMESPACE/grafanadatasources/thanos/"

curl -k $CURLOPTS $PATH