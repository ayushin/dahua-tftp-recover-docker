#!/bin/sh
CMD="nc $@"
echo "Starting $CMD"
exec $CMD
