# -*- coding: utf-8 -*-

import pymysql

mysql_host = ""
mysql_db = "lambda"
mysql_user = "lambda"
mysql_password = "lambda12345"


def lambda_handler(event, context):
    connection = pymysql.connect(
        host=mysql_host,
        db=mysql_db,
        user=mysql_user,
        passwd=mysql_password,
        charset='utf8')
    cursor = connection.cursor()
    try:
        cursor.execute('CREATE TABLE users (id int, name varchar(20), address varchar(50))')
    except:
        pass

    sql = "INSERT INTO users (id, name, address) VALUES (%s, %s, %s)"
    cursor.execute(sql, (10, "hoge_user", "Tokyo"))
    cursor.execute(sql, (20, "fuga_user", "Kyoto"))
    connection.commit()

    cursor.execute("SELECT * FROM users")
    for row in cursor:
        print("id=%d, user=%s, address=%s" % (row[0], row[1], row[2]))

    connection.close()

