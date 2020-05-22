#!/bin/bash

sed -i s#test#${PROJ_NAME}#g /root/monitor/prometheus/prometheus.yml
sed -i s#test#${PROJ_NAME}#g /root/conf.d/*.json
/usr/bin/supervisord -c /etc/supervisord.conf