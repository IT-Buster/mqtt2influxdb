#!/bin/bash

echo `date`: Myscript starts

cd /grafana/influxdb/backup/ && rm *.gz *.meta *.manifest

docker exec influxdb influxd backup -portable /var/lib/influxdb/backup/

ssh root@192.168.1.5 'cd /mnt/sda1/backup_influx/backup && rm *.manifest *.meta *.gz'

scp -r /grafana/influxdb/backup root@192.168.1.5:/mnt/sda1/backup_influx

echo `date`: Myscript stops
