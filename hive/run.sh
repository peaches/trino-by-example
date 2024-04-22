#!/usr/bin/env bash

schematool -dbType postgres -validate
if [[ $? -ne 0 ]];
then
  schematool -dbType postgres  -initSchema
fi;

hiveserver2 --service metastore --hiveconf hive.root.logger=INFO,console --hiveconf yarn.root.logger=DEBUG,console --hiveconf hadoop.root.logger=DEBUG,console &
hiveserver2 --hiveconf hive.root.logger=INFO,console --hiveconf yarn.root.logger=DEBUG,console --hiveconf hadoop.root.logger=DEBUG,console 
