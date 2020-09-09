#!/bin/bash

# Local postgres
# export PG_PROTO=tcp
# export PG_ADDR=localhost:5432
# export PG_DB=video2
# export PG_USER=postgres
# export PG_PASSWORD=postgres

# Google Cloud Postgres
export PG_PROTO=unix
export PG_ADDR=/cloudsql/wakeup-286404:europe-west1:wakeup/.s.PGSQL.5432
export PG_DB=wakeup
export PG_USER=wakeup
export PG_PASSWORD=wakeup

export GC_PROJECT=wakeup-286404
export GC_PROJECT_LOCATION=europe-west1

