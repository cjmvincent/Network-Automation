#!/bin/bash

# Backup MongoDB
# use the mongodump tool
# providing no additional paramters will connect to the instance on port 27017
mongodump --out /path/to/dump/to --gzip


# Back up OpenSearch
# use Snapshot API
# add the following to opensearch.yml file to register a snapshot repo
# path.repo: ["$HOME/snapshots"] # or wherever
# Backup to the repo using REST
PUT /_snapshot/snapshots/snapshot_month_day


# Backup Graylog
sudo systemctl stop graylog-server
# Graylog configs
cp /etc/graylog/server/server.conf /backup/path/
cp -r /etc/default/graylog-server/ /backup/path
# Graylog plugins and customizations
cp -r /usr/share/graylog-server/plugin/ /backup/path/
# Graylog message data
# This is backed up when backing up MongoDB
# Start Graylog
sudo systemctl start graylog-server