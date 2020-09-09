#!/bin/bash

# Google Cloud Postgres
export PG_PROTO=unix
export PG_ADDR=/cloudsql/wakeup-286404:europe-west1:wakeup/.s.PGSQL.5432
export PG_DB=wakeup
export PG_USER=wakeup
export PG_PASSWORD=wakeup

export GC_PROJECT=wakeup-286404
export GC_PROJECT_LOCATION=europe-west1

