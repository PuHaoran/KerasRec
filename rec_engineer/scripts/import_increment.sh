#!/bin/bash
:<<!
将前一天的业务数据导入（user_action数据一般通过flume收集到hdfs，这里为了项目测试方便也采用sqoop导入做法）。
!
time=`date +"%Y-%m-%d" -d "-1day"`
declare -A check
check=([user_profile]=update_time [movie]=update_time)
declare -A merge
merge=([user_profile]=user_id [movie]=item_id)

for k in ${!check[@]}
do
    sqoop import \
        --connect jdbc:mysql://192.168.88.128/ml1m \
        --username root \
        --password 123123 \
        --table $k \
        --m 4 \
        --target-dir /user/hive/warehouse/ml1m.db/$k \
        --incremental lastmodified \
        --check-column ${check[$k]} \
        --merge-key ${merge[$k]} \
        --last-value ${time}
done