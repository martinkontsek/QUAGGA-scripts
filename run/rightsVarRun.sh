#!/bin/bash

touch /var/run/zebra.pid
touch /var/run/eigrpd.pid

chown quagga:quagga /var/run/zebra.pid
chown quagga:quagga /var/run/eigrpd.pid

echo "Rights for /var/run set."

