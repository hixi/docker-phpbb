#!/bin/bash
set -e

/bin/wait-for-it.sh db:5432 -t 30

exec "$@"
