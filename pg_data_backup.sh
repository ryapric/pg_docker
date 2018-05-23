#!/usr/bin/env sh
set -e

tar -cvf pg_data.tar.gz /var/lib/docker/volumes/pg_data/_data/
