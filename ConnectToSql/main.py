# Для примера выберем выполнение 2-го задания

from getpass import getpass
from mysql.connector import connect, Error

try:
    with connect(
        host="localhost",
        user="root",
        password=getpass("Password:"),
    ) as connection:
        use_base = """USE homework2"""
        task2 = """
        SELECT
	        id AS "id заказа",
            CASE
		        WHEN count_product < 100 THEN "Маленький заказ"
                WHEN count_product BETWEEN 100 AND 300 THEN "Средний заказ"
                ELSE "Большой заказ"
	        END AS "Тип заказа"
        FROM sales
        """
        with connection.cursor() as cursor:
            cursor.execute(use_base)
            cursor.execute(task2)
            for row in cursor.fetchall():
                print(row)
except Error as e:
    print(e)

# Вывод консоли в приложенном jpg
