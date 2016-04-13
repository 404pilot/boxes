
## systemd

```
core@localhost /etc/systemd/system $ sudo systemctl enable elasticsearch.service
Created symlink from /etc/systemd/system/multi-user.target.wants/elasticsearch.service to /etc/systemd/system/elasticsearch.service.
```

```
core@localhost /etc/systemd/system $ sudo systemctl start elasticsearch.service
```

```
core@localhost /etc/systemd/system $ systemctl status elasticsearch.service
● elasticsearch.service - local single elasticserach 2.3 instance
   Loaded: loaded (/etc/systemd/system/elasticsearch.service; enabled; vendor preset: disabled)
   Active: active (running) since Wed 2016-04-13 03:47:27 UTC; 15s ago
  Process: 1170 ExecStartPre=/usr/bin/docker pull elasticsearch:2.3 (code=exited, status=0/SUCCESS)
  Process: 1162 ExecStartPre=/usr/bin/docker rm es-2.3 (code=exited, status=1/FAILURE)
  Process: 1089 ExecStartPre=/usr/bin/docker kill es-2.3 (code=exited, status=1/FAILURE)
 Main PID: 1345 (docker)
   Memory: 13.7M
      CPU: 388ms
   CGroup: /system.slice/elasticsearch.service
           └─1345 /usr/bin/docker run --name es-2.3 -p 0.0.0.0:9200:9200 -p 0.0.0.0:9300:9300 elasticsearch:2.3

Apr 13 03:47:29 localhost docker[1345]: [2016-04-13 03:47:29,427][INFO ][env                      ] [Vegas] using [1] data paths, mounts [[/usr/share/elasticsearch/data (/dev/sda... types [ext4]
Apr 13 03:47:29 localhost docker[1345]: [2016-04-13 03:47:29,429][INFO ][env                      ] [Vegas] heap size [1007.3mb], compressed ordinary object pointers [true]
Apr 13 03:47:31 localhost docker[1345]: [2016-04-13 03:47:31,156][INFO ][node                     ] [Vegas] initialized
Apr 13 03:47:31 localhost docker[1345]: [2016-04-13 03:47:31,156][INFO ][node                     ] [Vegas] starting ...
Apr 13 03:47:31 localhost docker[1345]: [2016-04-13 03:47:31,231][INFO ][transport                ] [Vegas] publish_address {172.18.0.2:9300}, bound_addresses {[::]:9300}
Apr 13 03:47:31 localhost docker[1345]: [2016-04-13 03:47:31,238][INFO ][discovery                ] [Vegas] elasticsearch/N3n2F61aQf23OwuKSemE1A
Apr 13 03:47:34 localhost docker[1345]: [2016-04-13 03:47:34,308][INFO ][cluster.service          ] [Vegas] new_master {Vegas}{N3n2F61aQf23OwuKSemE1A}{172.18.0.2}{172.18.0.2:9300...ins received)
Apr 13 03:47:34 localhost docker[1345]: [2016-04-13 03:47:34,333][INFO ][http                     ] [Vegas] publish_address {172.18.0.2:9200}, bound_addresses {[::]:9200}
Apr 13 03:47:34 localhost docker[1345]: [2016-04-13 03:47:34,333][INFO ][node                     ] [Vegas] started
Apr 13 03:47:34 localhost docker[1345]: [2016-04-13 03:47:34,353][INFO ][gateway                  ] [Vegas] recovered [0] indices into cluster_state
Hint: Some lines were ellipsized, use -l to show in full.
```

```
core@localhost /etc/systemd/system $ journalctl -f -u elasticsearch.service
-- Logs begin at Wed 2016-04-13 03:42:24 UTC. --
Apr 13 03:47:29 localhost docker[1345]: [2016-04-13 03:47:29,427][INFO ][env                      ] [Vegas] using [1] data paths, mounts [[/usr/share/elasticsearch/data (/dev/sda9)]], net usable_space [14.2gb], net total_space [15.5gb], spins? [possibly], types [ext4]
Apr 13 03:47:29 localhost docker[1345]: [2016-04-13 03:47:29,429][INFO ][env                      ] [Vegas] heap size [1007.3mb], compressed ordinary object pointers [true]
Apr 13 03:47:31 localhost docker[1345]: [2016-04-13 03:47:31,156][INFO ][node                     ] [Vegas] initialized
Apr 13 03:47:31 localhost docker[1345]: [2016-04-13 03:47:31,156][INFO ][node                     ] [Vegas] starting ...
Apr 13 03:47:31 localhost docker[1345]: [2016-04-13 03:47:31,231][INFO ][transport                ] [Vegas] publish_address {172.18.0.2:9300}, bound_addresses {[::]:9300}
Apr 13 03:47:31 localhost docker[1345]: [2016-04-13 03:47:31,238][INFO ][discovery                ] [Vegas] elasticsearch/N3n2F61aQf23OwuKSemE1A
Apr 13 03:47:34 localhost docker[1345]: [2016-04-13 03:47:34,308][INFO ][cluster.service          ] [Vegas] new_master {Vegas}{N3n2F61aQf23OwuKSemE1A}{172.18.0.2}{172.18.0.2:9300}, reason: zen-disco-join(elected_as_master, [0] joins received)
Apr 13 03:47:34 localhost docker[1345]: [2016-04-13 03:47:34,333][INFO ][http                     ] [Vegas] publish_address {172.18.0.2:9200}, bound_addresses {[::]:9200}
Apr 13 03:47:34 localhost docker[1345]: [2016-04-13 03:47:34,333][INFO ][node                     ] [Vegas] started
Apr 13 03:47:34 localhost docker[1345]: [2016-04-13 03:47:34,353][INFO ][gateway                  ] [Vegas] recovered [0] indices into cluster_state
```
