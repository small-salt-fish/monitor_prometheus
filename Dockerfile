FROM alpine:3.9
WORKDIR /root

MAINTAINER dacang

ENV PROJ_NAME=test \
    CK_URI=localhost:8123 \
    ES_HOST=localhost:9200 \
    KAFKA_SERVER=localhost:9092 \
    TOKEN=26bd98b11352ce57e509489101beb26a3e5d7514b6337de1931b2f370b338fd0

COPY ./config-manager /config-manager/
COPY ./config /root/config

RUN echo "http://mirrors.aliyun.com/alpine/v3.9/main" > /etc/apk/repositories \
    && echo "http://mirrors.aliyun.com/alpine/v3.9/community" >> /etc/apk/repositories \
    && apk upgrade --update \
    && apk add -U bash tzdata wget sed coreutils libc6-compat ca-certificates su-exec nodejs nodejs-npm supervisor \
    && cp -r -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && ln -sf /bin/bash /bin/ash \
    && addgroup -g 1099 admin \
    && adduser  -u 1099 -G admin -D admin \
    && cd /root/ \
    && wget -c -q https://dtstack-prod.oss-cn-hangzhou.aliyuncs.com/monitor_v3.tgz \
    && tar -zxf monitor_v3.tgz \
    && rm -rf monitor_v3.tgz \
    && mv /root/config/supervisord/supervisord.conf /etc/ \
    && mv /root/config/conf.d /root \
    && mv /root/config/alertrules/*.rules.yml /root/monitor/prometheus/alertrules/ \
    && mv /root/config/prometheus/prometheus.yml /root/monitor/prometheus/ \
    && mv /root/config/entrypoint.sh /usr/local/bin/entrypoint.sh \
    && rm -rf /root/config \
    && chown -R admin:admin /root/monitor \
    && cd /config-manager/ \
    && npm config set registry https://registry.npm.taobao.org/ \
    && npm config set unsafe-perm true \
    && npm install -g yarn \
    && yarn global add server-config-manager \
    && chmod +x /usr/local/bin/entrypoint.sh
CMD ["/usr/local/bin/entrypoint.sh"]