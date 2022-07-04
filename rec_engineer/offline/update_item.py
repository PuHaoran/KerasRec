import os
import sys
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE_DIR))
from offline import SparkSessionBase
import logging

logger = logging.getLogger('offline')


class UpdateItem(SparkSessionBase):
    """
    更新物品画像
    """
    SPARK_APP_NAME = "UpdateItem"
    ENABLE_HIVE_SUPPORT = True
    SPARK_EXECUTOR_MEMORY = "7g"

    def __init__(self):
        self.spark = self._create_spark_session()

    def get_user_data(self):
        self.spark.sql("use ml1m")


if __name__ == '__main__':
    ua = UpdateItem()
    ua.get_user_data()

