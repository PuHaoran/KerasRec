#!/bin/bash

array=(user_profile movie user_action)

for table_name in ${array[@]};
do
    sqoop import \
        --connect jdbc:mysql://192.168.88.128/ml1m \
        --username root \
        --password 123123 \
        --table $table_name \
        --m 5 \
        --hive-home /root/bigdata/hive \
        --hive-import \
        --create-hive-table  \
        --hive-drop-import-delims \
        --warehouse-dir /user/hive/warehouse/ml1m.db \
        --hive-table ml1m.$table_name
done