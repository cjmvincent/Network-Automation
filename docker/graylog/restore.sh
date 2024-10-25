#!/bin/bash

# Restore MongoDB
# use the mongodump tool
# providing no additional paramters will restore the instance running on port 27017
mongorestore /path/to/backup/ --gzip


# Restore OpenSearch
# Close indicies
POST /<index>/_close
# use Snapshot API
POST /_snapshot/snapshot_month_day/_restore
# Start indicies
POST /<index>/_open


# Restore Graylog
sudo systemctl stop graylog-server
# Graylog configs
cp /backup/path/server.conf /etc/graylog/server/
cp -r /backup/path/graylog-server /etc/default/
# Graylog plugins and customizations
cp -r /backup/path/plugin /usr/share/graylog-server/
# Graylog message data
# This is restoreded up when restoring MongoDB