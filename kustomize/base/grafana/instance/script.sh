#!/bin/bash

TOKEN=$(cat /var/run/secrets/tokens/thanos-token)
PATCH="'[{\"op\": \"replace\", \"path\":\"/spec/datasources/0/secureDataJson/httpHeaderValue1\", \"value\": \"Bearer ${TOKEN}\"}]'"

set +x
oc patch grafanadatasources thanos -n $(cat /var/run/secrets/token/serviceaccount/namespace) --type json --patch ${PATCH}