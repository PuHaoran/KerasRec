一、增量导入业务数据表到hive表。
1）将csv文件导入到业务数据库。
2）新建import_increment.sh，通过sqoop将新增、修改的用户和物品业务表数据增量导入hive表(初始化时在hive中建立表结构，然后sqoop导入到hdfs，然后建立hive表关联）。
    user、movie使用lastmodified模式，根据update_time作为last_time，并根据user_id合并。（合并增量导入的重复数据）
3）crontab -e每隔半小时将大于-1天的数据执行增量导入功能。
*/30 * * * * /root/KerasRec/rec_engineer/scripts/import_incremental.sh

Mysql与Hive对应的数据类型。
MySQL(bigint) --> Hive(bigint)
MySQL(tinyint) --> Hive(boolean)
MySQL(int) --> Hive(int)
MySQL(double) --> Hive(double)
MySQL(bit) --> Hive(boolean)
MySQL(varchar) --> Hive(string)
MySQL(decimal) --> Hive(double)
MySQL(date/timestamp) --> Hive(string)

二、通过flume实时收集服务器中的日志到hdfs。（省去该步骤，直接通过增量导入方式实现。）

三、物品画像计算。
1）建立item_profile表。
2）tfidf+textrank的top20共现词作为关键词，先全量计算，然后每隔1小时增量计算一次。


git fetch --all
git reset --hard origin/master

pycharm使用远程spark环境。
PYTHONUNBUFFERED=1
JAVA_HOME=/usr/local/bigdata/jdk1.8.0
SPARK_HOME=/usr/local/bigdata/spark-2.1.1-bin-hadoop2.7
HADOOP_HOME=/usr/local/bigdata/hadoop-2.7.7
PYSPARK_PYTHON=/root/anaconda3/envs/py36/bin/python
PYSPARK_DRIVER_PYTHON=/root/anaconda3/envs/py36/bin/python