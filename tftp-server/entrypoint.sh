#!/bin/sh
CMD="in.tftpd -L --verbose -u tftp --address 0.0.0.0:69 $@"
echo "Starting $CMD"
in.tftpd --version
exec $CMD
