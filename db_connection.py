import mysql.connector

def get_db_connection():
    # Establishes and returns a database connection.
    try:
        mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",
            database="iterable"
        )
        if mydb.is_connected():
            print("Successfully connected to MySQL database!")
        return mydb
    except mysql.connector.Error as err:
        print(f"Error connecting to database: {err}")
        return None