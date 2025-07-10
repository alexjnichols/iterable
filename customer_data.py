from db_connection import get_db_connection

def fetch_data():
    mydb = get_db_connection()
    if mydb:
        try:
            # Create a cursor object to execute SQL queries
            cursor = mydb.cursor()
            # Execute query
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
            # Fetch results from db
            results = cursor.fetchall()
            return results
        except mydb.connector.Error as err:
            print(f"Error executing query: {err}")
            return None