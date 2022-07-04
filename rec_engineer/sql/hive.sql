-- 创建hive业务数据库ml1m
create database if not exists ml1m comment "user,movie information of ml1m mysql" location '/user/hive/warehouse/ml1m.db/';

create table user_profile(
user_id BIGINT comment "user_id",
gender STRING comment "gender",
age INT comment "age",
occupation INT comment "occupation",
zipcode INT comment "zipcode",
update_time STRING comment "update_time")
COMMENT "ml1m user profile"
row format delimited fields terminated by ','
LOCATION '/user/hive/warehouse/ml1m.db/user_profile';

create table movie(
item_id BIGINT comment "item_id",
title STRING comment "title",
item_cate String comment "item_cate",
update_time STRING comment "update_time")
COMMENT "ml1m item"
row format delimited fields terminated by ','
LOCATION '/user/hive/warehouse/ml1m.db/movie';

create table user_action(
id BIGINT comment "id",
user_id BIGINT comment "user_id",
item_id BIGINT comment "item_id",
rating INT comment "rating",
click_date STRING comment "click_date")
COMMENT "ml1m user_action"
row format delimited fields terminated by ','
LOCATION '/user/hive/warehouse/ml1m.db/user_action';

create table item_profile(
item_id BIGINT comment "item_id",
topics ARRAY comment "topics",
COMMENT "ml1m item_profile"
row format delimited fields terminated by ','
LOCATION '/user/hive/warehouse/ml1m.db/item_profile';