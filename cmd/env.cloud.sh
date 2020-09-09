#!/bin/bash
export GOOGLE_APPLICATION_CREDENTIALS=./serviceaccount.json

# Google Cloud Postgres
export PG_PROTO=unix
export PG_ADDR=/cloudsql/wakeup-286404:europe-west1:wakeup/.s.PGSQL.5432
export PG_DB=wakeup
export PG_USER=wakeup
export PG_PASSWORD=wakeup

export GC_PROJECT=wakeup-286404
export GC_PROJECT_LOCATION=europe-west1

export CALL_ROOM_ENDPOINT=https://$GC_PROJECT_LOCATION-$GC_PROJECT.cloudfunctions.net/CallRoom
export SCHEDULER_LOCATION=projects/$GC_PROJECT/locations/$GC_PROJECT_LOCATION
export SCHEDULER_TIMEZONE=Europe/Moscow
export SCHEDULER_MAX_RETRY_COUNT=2
export SCHEDULER_RETRY_PERIOD=5m
export CALL_ENDPOINT=https://www.google.com/
