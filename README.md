# Tea Subscription

## Backend API for Tea Subscription

This allows the following features to the tea subscription.
- Subscribe for Tea
- Cancel subscription for Tea
- View all subscription

### Endpoints

---

#### Subscriptions
<details>
  <summary>POST: Create Subscription</summary>
  
  <br>
  Request:

  ```JS
  POST /api/v1/subscription
  ```


  Headers:

  ```JS
  Content-Type: application/json
  ```


  Body: 

	```JSON
	{
		"customer_id": "14",
		"subscription_id": "1"
	}

  <br>

  Response: 

  ```JSON
  {
    "data": {
      "type": "user",
      "attributes": {
        "email": "example@example.com",
        "user_type": "donor",
        "username": "example_username"
      }
    }
  }
  ```
</details>

<details>
  <summary>GET: All Users</summary>
  
  <br>
  Request:

  ```JS
  GET /api/v1/users
  ```

  Response: 

  | Result | Status |
  | ------- | ------| 
  | `Success` | 201 |
  | `Failure`| 401 |




<br>

---

<br>