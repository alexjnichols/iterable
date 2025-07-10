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
    cursor = mydb.cursor()

    # Example: Execute a query
    cursor.execute("""
    SELECT
        c.id,
        c.first_name,
        c.last_name,
        c.email,
        c.plan_type,
        pv.page,
        pv.device,
        pv.browser,
        pv.location,
        pv.event_time,
        c.candidate
    FROM
        customers c
    INNER JOIN page_views pv ON pv.user_id = c.id
    WHERE
        c.plan_type = 'pro'
        and (pv.page = 'settings' or pv.page = 'pricing')
        and pv.event_time > CURRENT_TIMESTAMP() - INTERVAL 7 DAY
                   """)

    # Fetch results
    results = cursor.fetchall()
    for row in results:
        print(row)

except mysql.connector.Error as err:
    print(f"Error: {err}")

# finally:
    # Close the cursor and connection
    # if 'cursor' in locals() and cursor is not None:
    #     cursor.close()
    # if 'mydb' in locals() and mydb.is_connected():
    #     mydb.close()
    #     print("MySQL connection closed.")