# Kumori Backend: Grafana Monitoring System with InfluxDB

### Prerequisites

- Docker-CE 18.06+
- Docker Compose v1.23.1+

### Usage

    $ docker-compose pull

    $ docker-compose up

    $ open http://localhost:3000

### FAQ

#### [InfluxDB] How do I check running InfluxDB's version?

```bash
$ docker exec -it influxdb influx -version
```

#### [InfluxDB] How do I initialize my database?

```bash
$ ./influxdb/provision.sh
```


#### [Grafana] How do I initialize my Grafana with InfluxDB?

1. Login via http://localhost:3000, use the default user/pass: admin/admin

2. Configure Data Source

```
[Data Source]
- Name: MyInfluxDataSource
- Type: InfluxDB

[HTTP]
- URL: http://influxdb:8086
- Access: Server (Default)

[Auth]
- With Credentials (checked)
- other (unchecked)

[InfluxDB]
- Database: test
- User: grafana
- Password: grafana
```

3. Update Settings

Now, click "Save & Test", and now you should be able to see message prompt: `Data source is working`


#### [Misc] Where can I find my data?

After upgrading to Grafana 5.1+, data store changed, please find your data via `$ docker volume ls`

Reference: [FAQ - Grafana Migration][faq-grafana-migration]

```bash
$ docker volume ls

DRIVER          VOLUME NAME
local           kumori_grafana_lib
local           kumori_grafana_log
local           kumori_influxdb_lib
```

### Docker Images

- [Grafana v6.0.2][docker-image-grafana]
- [InfluxDB 1.7.4][docker-image-influxdb]

[docker-image-influxdb]: https://hub.docker.com/_/influxdb/
[docker-image-grafana]: https://hub.docker.com/r/grafana/grafana/
[faq-grafana-migration]: http://docs.grafana.org/installation/docker/#migration-from-a-previous-version-of-the-docker-container-to-5-1-or-later
