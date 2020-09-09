#!/bin/bash
source ./env.sh
cd ..
gcloud functions deploy ScheduleCall \
--runtime go113 \
--allow-unauthenticated \
--trigger-http \
--project $GC_PROJECT \
--set-env-vars PG_PROTO=$PG_PROTO,PG_ADDR=$PG_ADDR,PG_DB=$PG_DB,PG_USER=$PG_USER,PG_PASSWORD=$PG_PASSWORD,GC_PROJECT=$GC_PROJECT,GC_PROJECT_LOCATION=$GC_PROJECT_LOCATION \
--region $GC_PROJECT_LOCATION \
--memory 128MB \
--max-instances 10
cd cmd