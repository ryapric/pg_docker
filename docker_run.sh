#!/usr/bin/env sh
set -e

docker container run \
    -d \
    -p 5432:5432 \
    -e POSTGRES_PASSWORD=postgres \
    -v pg_data:/var/lib/postgresql/data/ \
    --name my-postgres \
    postgres
