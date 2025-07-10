import os
import requests
from dotenv import load_dotenv
from datetime import datetime
from customer_data import fetch_data

# Load environment variables from .env file
load_dotenv()

# Access the API key
api_key = os.getenv("API_KEY")
iterable_user_endpoint = "https://api.iterable.com/api/users/update"
iterable_event_endpoint = "https://api.iterable.com/api/events/track"

headers = {
    "Authorization": f"Bearer {api_key}",
    "Content-Type": "application/json"
}

# headers = {
#     "X-API-Key": api_key,
#     "Content-Type": "application/json"
# }

def track_users():
    print('hi')

def create_update_users(payload):
    # print(payload)
    try:
        response = requests.post(iterable_user_endpoint, headers=headers, json=payload)
        response.raise_for_status()  # Raise an HTTPError for bad responses (4xx or 5xx)
        print("Response status code:", response.status_code)
        print("Response JSON:", response.json())

    except requests.exceptions.ConnectionError as e:
        print(f"Connection error: {e}")
    except requests.exceptions.Timeout as e:
        print(f"Request timed out: {e}")
    except requests.exceptions.HTTPError as e:
        print(f"HTTP error: {e}")
    except requests.exceptions.RequestException as e:
        print(f"An unexpected error occurred: {e}")

def format_user_data():
    customers = fetch_data()
    for row in customers:
        # cast int to string for iterable api
        user_id = str(row[0])
        first_name = row[1]
        last_name = row[2]
        email = row[3]
        plan = row[4]
        page_view = row[5]
        device = row[6]
        browser = row[7]
        location = row[8]
        # convert date object to string
        event_time = row[9].strftime("%Y-%m-%d %H:%M:%S")
        candidate = row[10]

        payload = {
            "createNewFields": True,
            "dataFields": {
                "first_name": first_name,
                "last_name": last_name,
                "email": email,
                "plan": plan,
                "page_view": page_view,
                "device": device,
                "browser": browser,
                "location": location,
                "event_time": event_time,
                "candidate": candidate
            },
            "email": email,
            "mergeNestedObjects": True,
            "preferUserId": True,
            "userId": user_id
        }
        create_update_users(payload)


if __name__ == "__main__":
    format_user_data()