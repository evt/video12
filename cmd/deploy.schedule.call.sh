#!/bin/bash
source ./env.cloud.sh
cd ..
gcloud functions deploy ScheduleCall \
--runtime go113 \
--allow-unauthenticated \
--trigger-http \
--project $GC_PROJECT \
--set-env-vars PG_PROTO=$PG_PROTO,PG_ADDR=$PG_ADDR,PG_DB=$PG_DB,PG_USER=$PG_USER,PG_PASSWORD=$PG_PASSWORD,GC_PROJECT=$GC_PROJECT,GC_PROJECT_LOCATION=$GC_PROJECT_LOCATION,CALL_ROOM_ENDPOINT=$CALL_ROOM_ENDPOINT,SCHEDULER_LOCATION=$SCHEDULER_LOCATION,SCHEDULER_TIMEZONE=$SCHEDULER_TIMEZONE,CALL_ENDPOINT=$CALL_ENDPOINT,SCHEDULER_MAX_RETRY_COUNT=$SCHEDULER_MAX_RETRY_COUNT,SCHEDULER_RETRY_PERIOD=$SCHEDULER_RETRY_PERIOD \
--region $GC_PROJECT_LOCATION \
--memory 128MB \
--max-instances 10
cd cmd