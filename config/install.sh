#!/bin/bash

mv /root/config/supervisord/supervisord.conf /etc/
mv /root/config/conf.d /root
mv /root/config/alertrules/*.rules.yml /root/monitor/prometheus/alertrules/
mv /root/config/prometheus/prometheus.yml /root/monitor/prometheus/
rm -rf /root/config
sed -i s#test#${PROJ_NAME}#g /root/monitor/prometheus/prometheus.yml
sed -i s#test#${PROJ_NAME}#g /root/conf.d/*.json

