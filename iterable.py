import mysql.connector

try:
    # Establish the connection
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="iterable"
    )

    if mydb.is_connected():
        print("Successfully connected to MySQL database!")

    # Create a cursor object to execute SQL queries
    # cursor = mydb.cursor()

    # Example: Execute a query
    # cursor.execute("SELECT * FROM your_table_name")

    # Fetch results
    # results = cursor.fetchall()
    # for row in results:
    #     print(row)

except mysql.connector.Error as err:
    print(f"Error: {err}")

# finally:
    # Close the cursor and connection
    # if 'cursor' in locals() and cursor is not None:
    #     cursor.close()
    # if 'mydb' in locals() and mydb.is_connected():
    #     mydb.close()
    #     print("MySQL connection closed.")