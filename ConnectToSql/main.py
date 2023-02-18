from getpass import getpass
from mysql.connector import connect, Error

try:
    with connect(
        host="localhost",
        user="root",
        password=getpass("Password:"),
    ) as connection:
        use_base = """USE homework2"""
        create_table = """CREATE TABLE IF NOT EXISTS sales2
                            (
                            id INT PRIMARY KEY AUTO_INCREMENT,
                            order_date DATE,
                            count_product INT
                            )
                        """
        insert_to_table = """INSERT INTO sales2 (order_date, count_product)
                                VALUES 
                                    ("2022-01-01", 156),
                                    ("2022-01-02", 180),
                                    ("2022-01-03", 21),
                                    ("2022-01-04", 124),
                                    ("2022-01-05", 341)
                            """
        read_from_table = """SELECT * FROM sales2"""
        update_table = """UPDATE sales2 
                            SET count_product = 0 WHERE count_product < 100
                        """
        drop_table = """DROP TABLE IF EXISTS sales2"""

        with connection.cursor() as cursor:
            cursor.execute(use_base)
            cursor.execute(create_table)
            cursor.execute(insert_to_table)
            cursor.execute(read_from_table)
            for row in cursor.fetchall():
                print(row)
            print("----------------------------------------------------")
            cursor.execute(update_table)
            cursor.execute(read_from_table)
            for row in cursor.fetchall():
                print(row)
            cursor.execute(drop_table)
except Error as e:
    print(e)

# Вывод консоли в приложенном jpg
