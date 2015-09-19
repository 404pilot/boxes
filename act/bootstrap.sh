#!/bin/bash

rvm install jruby-1.7.19

gem install bundler

docker run -d --name postgres-db \
         -e POSTGRES_USER=postgres \
         -e POSTGRES_PASSWORD=123456 \
    	 -p 5432:5432 \
         postgres:9.4
