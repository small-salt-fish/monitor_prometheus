# DTstack-Easylog-Monitor

## Pull docker
```docker pull registry.cn-hangzhou.aliyuncs.com/dtstack-prod/monitor:latest```

## Start docker
```
cd ./docker-compose
docker-compose.yml up -d 
```

## Expose port
```
granafa: 3000
prometheus: 9090
kafka_exporter: 9308
blackbox_exporter: 9115
clickhouse_exporter: 9116
elasticsearch_exporter: 9108

config-manager: 10011
```

## Packages
### grafana-5.3.2

```
dashboards_conf_dir: /root/monitor/grafana/conf/provisioning/dashboards/
dashboards_dir: /root/monitor/grafana/data/dashboard
```

### prometheus-2.4.3.linux-amd64

### blackbox_exporter-0.12.0.linux-amd64

```
Help on flags:
    -h, --help                Show context-sensitive help (also try --help-long and --help-man).
    --config.file="blackbox.yml"  
        Blackbox exporter configuration file.
    --web.listen-address=":9115"  
        The address to listen on for HTTP requests.
    --timeout-offset=0.5  Offset to subtract from timeout in seconds.
    --log.level=info      Only log messages with the given severity or above. One of: [debug, info, warn, error]
    --version             Show application version.
      
blackbox_config_file: /root/monitor/blackbox_exporter/blackbox.yml
```

### elasticsearch_exporter-1.0.4rc1.linux-amd64

```
Help on flags:
    -es.all
    	Export stats for all nodes in the cluster. If used, this flag will override the flag es.node.
    -es.ca string
    	Path to PEM file that contains trusted CAs for the Elasticsearch connection.
    -es.client-cert string
    	Path to PEM file that contains the corresponding cert for the private key to connect to Elasticsearch.
    -es.client-private-key string
    	Path to PEM file that contains the private key for client auth when connecting to Elasticsearch.
    -es.indices
    	Export stats for indices in the cluster.
    -es.node string
    	Node's name of which metrics should be exposed. (default "_local")
    -es.shards
    	Export stats for shards in the cluster (implies es.indices=true).
    -es.ssl-skip-verify
    	Skip SSL verification when connecting to Elasticsearch.
   -es.timeout duration
    	Timeout for trying to get stats from Elasticsearch. (default 5s)
   -es.uri string
    	HTTP API address of an Elasticsearch node. (default "http://localhost:9200")
   -log.format string
    	Sets the log format. Valid formats are json and logfmt (default "logfmt")
   -log.level string
        Sets the loglevel. Valid levels are debug, info, warn, error (default "info")
   -log.output string
    	Sets the log output. Valid outputs are stdout and stderr (default "stdout")
   -version
    	Show version and exit
   -web.listen-address string
    	Address to listen on for web interface and telemetry. (default ":9108")
   -web.telemetry-path string
    	Path under which to expose metrics. (default "/metrics")

```

### kafka_exporter-1.2.0.linux-amd64
```
Help on flags:
    -h, --help                   Show context-sensitive help (also try --help-long and --help-man).
    --web.listen-address=":9308"  
        Address to listen on for web interface and telemetry.
    --web.telemetry-path="/metrics"  
        Path under which to expose metrics.
    --topic.filter=".*"      Regex that determines which topics to collect.
    --group.filter=".*"      Regex that determines which consumer groups to collect.
    --log.enable-sarama      Turn on Sarama logging.
    --kafka.server=kafka:9092 ...  
       Address (host:port) of Kafka server.
    --sasl.enabled           Connect using SASL/PLAIN.
    --sasl.handshake         Only set this to false if using a non-Kafka SASL proxy.
    --sasl.username=""       SASL user name.
    --sasl.password=""       SASL user password.
    --tls.enabled            Connect using TLS.
    --tls.ca-file=""         The optional certificate authority file for TLS client authentication.
    --tls.cert-file=""       The optional certificate file for client authentication.
    --tls.key-file=""        The optional key file for client authentication.
    --tls.insecure-skip-tls-verify  
        If true, the server's certificate will not be checked for validity. This will make your HTTPS connections insecure.
    --kafka.version="1.0.0"  Kafka broker version
    --log.level="info"       Only log messages with the given severity or above. Valid levels: [debug, info, warn, error, fatal]
    --log.format="logger:stderr"  
        Set the log target and format. Example: "logger:syslog?appname=bob&local=7" or "logger:stdout?json=true"
    --version                Show application version.
```

### clickhouse_exporter
```
Help on flags:
    -insecure
        Ignore server certificate if using https (default true)
     -log.level value
        Only log messages with the given severity or above. Valid levels: [debug, info, warn, error, fatal, panic].
     -scrape_uri string
        URI to clickhouse http endpoint (default "http://localhost:8123/")
    -telemetry.address string
        Address on which to expose metrics. (default ":9116")
    -telemetry.endpoint string
        Path under which to expose metrics. (default "/metrics")
```

