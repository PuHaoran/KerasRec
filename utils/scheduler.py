#!/usr/bin/env python
# coding: utf-8

# ## 任务调度
# 
# 离线任务调度我们通常可以使用linux crontab或者python APScheduler。
# 
# pip install APScheduler==3.5.3
import time
from apscheduler.executors.pool import ProcessPoolExecutor
from apscheduler.schedulers.blocking import BlockingScheduler


def test_job(path):
    t = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(time.time()))
    f = open(path, 'a')
    f.write(t + '\n')
    f.close()
    print("test job ", t)


def main():

    # 多进程执行，最大线程数10
    executors = {
        'default': ProcessPoolExecutor(3)
    }

    # 生成一个调度器对象
    scheduler = BlockingScheduler(executors=executors)

    # 增加一个任务
    scheduler.add_job(test_job, trigger='interval', seconds=5, args=['./test_log.txt'])

    scheduler.start()


if __name__ == '__main__':
    main()
