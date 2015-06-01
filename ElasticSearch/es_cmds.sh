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

# curl -X GET "http://192.168.33.10:9200/audit/_analyze?pretty=true\
# &field="event.target.typeURI"\
# &text="service/bss/billing/Account""

###### analyze: standard simple whitespace stop keyword -> these can be configured in settings
###### https://www.elastic.co/guide/en/elasticsearch/reference/current/analysis-lang-analyzer.html
###### whitespace, keyword is one without lower case tokenizer
###### use keyword? simply mark the field as `not_analyzed`

# curl -X GET "http://192.168.33.10:9200/audit/_analyze?pretty=true\
# &analyzer=snowball\
# &text=service/bss/billing/Account"

# curl -X GET http://192.168.33.10:9200/audit/_analyze?analyzer=keyword&pretty=true -d '
# service/bss/billing/account
# '


#### search

# curl -X GET http://192.168.33.10:9200/audit/billing/_search?pretty=true -d '
# {
#     "query" : {
#         "filtered" : { 
#             "query" : {
#                 "match_all" : {} 
#             },
#             "filter" : {
#                 "term" : { 
#                     "event.target.typeURI" : "service"
#                 }
#             }
#         }
#     }
# }
# '

# curl -X GET http://192.168.33.10:9200/audit/billing/_search?pretty=true -d '
# {
#     "query" : {
#         "filtered" : { 
#             "query" : {
#                 "match_all" : {} 
#             },
#             "filter" : {
#                 "bool" : {
#                     "must" : {
#                         "term" : { "event.target.typeURI" : "bss" }
#                     },
#                     "must_not" : {
#                         "term" : { "event.target.typeURI" : "account" }
#                     }
#                 }
#             }
#         }
#     }
# }
# '

# curl -X GET http://192.168.33.10:9200/audit/billing/_search?pretty=true -d '
# {
#     "query" : {
#         "filtered" : { 
#             "query" : {
#                 "match_all" : {} 
#             },
#             "filter" : {
#                 "and" : [
#                     {
#                         "range" : {
#                             "event.eventTime" : {
#                                 "from" : "2015-03-15",
#                                 "to" : "2015-03-25"
#                             }
#                         }
#                     },
#                     {
#                         "term" : { "event.target.typeURI" : "account" }
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