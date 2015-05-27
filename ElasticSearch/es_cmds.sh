#!/bin/bash

# index: audit
# type: event

# delete
# curl -X DELETE http://192.168.33.10:9200/audit


# search 
# curl -X GET http://192.168.33.10:9200/audit/_search?pretty


# check mapping
# curl -X GET http://192.168.33.10:9200/audit/_mapping?pretty
# curl -X GET http://192.168.33.10:9200/audit/event/_mapping?pretty


# analyze
# curl -X GET http://192.168.33.10:9200/audit/_analyze?field=audits.event.eventtime -d '
# 2015-02-01T20:52:57.04+00:00
# '

# curl -X GET "http://192.168.33.10:9200/audit/_analyze?pretty=true&field=audits.event.eventtime&text=2015-02-01T20:52:57.04+00:00"

echo