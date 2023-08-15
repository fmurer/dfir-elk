# DFIR ELK - Elastic Stack for DFIR Investigations

## Ressources
- https://www.elastic.co/blog/getting-started-with-the-elastic-stack-and-docker-compose
- https://www.elastic.co/guide/en/elasticsearch/reference/8.9/docker.html

## Prerequisites
Docker must be installed on the system. To do so, you can use the installation script.
```bash
sudo bash install_docker.sh
```

## Folder Structure
This project is based on a certain folder structure.

### Filebeat / Filebeat Inputs
The directory `filebeat/filebeat_inputs` contains `.yml` files defining how filebeat handles the different log ingests. In case a new log type should be ingested, there must be a corresponding filebeat input according to the following template:
```yaml
- type: log
  paths:
    - /ingest/LOGNAME/*/*/*/*/*
    - /ingest/LOGNAME/*/*/*/*
    - /ingest/LOGNAME/*/*/*
    - /ingest/LOGNAME/*/*
    - /ingest/LOGNAME/*
  exclude_files: [ 'readme.txt', '\.gz$', '\.bz2$', '\.zip$' ]
  close_inactive: 5m
  fields_under_root: true
  fields:
    type: LOGNAME
```
where `LOGNAME` is a descriptive name of the log source.

### Ingest
This is the folder used by Filebeat to ingest new log files.

- `hayabusa`: This folder expects `csv` files generated by [Hayabusa](https://github.com/Yamato-Security/hayabusa) using the following command.
`./hayabusa-2.7.0-lin-musl csv-timeline -d <EVENTLOG_FOLDER> -o hayabusa.csv -U`

### Logstash
This folder contains the logstash pipeline.

- `000X`: Inputs
- `100X` / `200X`: Preprocessing
- `300X`: Filtering
- `400X`: Postprocessing
- `500X`: Output

## Setup

1. Start the DFIR-ELK. `sudo docker compose up`
2. Connect to Kibana: http://localhost:5601
