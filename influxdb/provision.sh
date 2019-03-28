#!/usr/bin/env bash

ADMIN_USER="admin"
ADMIN_PASS="admin"

GRAFANA_USER="grafana"
GRAFANA_PASS="grafana"


curl -X POST "http://localhost:8086/query?u=$ADMIN_USER&p=$ADMIN_PASS" --data-urlencode "q=CREATE DATABASE test"

curl -X POST "http://localhost:8086/query?u=$ADMIN_USER&p=$ADMIN_PASS" \
  --data-urlencode "q=CREATE USER \"$GRAFANA_USER\" WITH PASSWORD '$GRAFANA_PASS'"

curl -X POST "http://localhost:8086/query?u=$ADMIN_USER&p=$ADMIN_PASS" \
  --data-urlencode "q=GRANT READ ON \"test\" TO \"$GRAFANA_USER\""
