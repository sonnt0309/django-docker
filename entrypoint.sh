#!/bin/bash
set -e
cmd="$@"


export REDIS_URL=redis://redis:6379

# the official postgres image uses 'postgres' as default user if not set explictly.

if [ -z "$REDIS_DEDICATED_DATABASE" ]; then
    export REDIS_DEDICATED_DATABASE=0
fi

export CELERY_BROKER_URL=$REDIS_URL/$REDIS_DEDICATED_DATABASE

exec $cmd
