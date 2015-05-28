#!/bin/bash

# index: audit
# type: event

#### delete
# curl -X DELETE http://192.168.33.10:9200/audit


#### search all
# curl -X GET http://192.168.33.10:9200/audit/_search?pretty


#### check mapping
# curl -X GET http://192.168.33.10:9200/audit/_mapping?pretty
# curl -X GET http://192.168.33.10:9200/audit/billing/_mapping?pretty


#### analyze
# curl -X GET http://192.168.33.10:9200/audit/_analyze?field=event.target.id -d '
# 020-1234567
# '

# curl -X GET "http://192.168.33.10:9200/audit/_analyze?pretty=true&field=event.eventtime&text=2015-02-01T20:52:57.04+00:00"



#### search

# curl -X GET http://192.168.33.10:9200/audit/billing/_search?pretty -d '
# {
#     "query": {
#         "filtered": {
#             "query": {
#                 "match_all": {}
#             },
#             "filter": {
#                 "and": [
#                     {
#                         "range" : {
#                             "event.eventtime" : { 
#                                 "from" : 2015-02-02, 
#                                 "to" : "2015-02-03"
#                             }
#                         },
#                     },
#                     {
#                         "term": {
#                             "event.target.id": "020-1234567"
#                         }
#                     }
#                 ]
#             }
#         }
#     }
# }
# '



# Shutdown local node
# curl -XPOST http://192.168.33.10:9200/_cluster/nodes/_local/_shutdown

# Shutdown all nodes in the cluster
# curl -XPOST http://192.168.33.10:9200/_shutdown

echo