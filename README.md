# Tea Subscription

## Backend API for Tea Subscription

This allows the following features to the tea subscription.
- Subscribe for Tea
- Cancel subscription for Tea
- View all subscription

### Endpoints

---

#### Customer Subscriptions
<details>
  <summary>POST: Create Customer Subscription</summary>
  
  <br>
  Request:

  ```JS
  POST /api/v1/customer_subscriptions
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
	```

  <br>

  Response: 

	```JSON
		{
			"data": {
				"id": "13",
				"type": "customer_subscription",
				"attributes": {
					"customer_id": 2,
					"subscription_id": 2
				}
			}
		}
	```

</details>

<details>
  <summary>GET: All Subscriptions for a Customer</summary>
  
  <br>
  Request:

  ```JS
  GET /api/v1/customer_subscriptions
  ```

  Params: 

  | Name | Requirement | Type | Description |
  | ----- | ----------- | -----| -------------- | 
  | `customer_id` | Required | string | Customer ID


	Response:

	```JSON
	{
    "data": [
			{
				"id": "1",
				"type": "subscriptions",
				"attributes": {
					"title": "Premium",
					"price": 59.5643354788551,
					"status": "inactive",
					"frequency": 0
				}
			},
			{
				"id": "2",
				"type": "subscriptions",
				"attributes": {
					"title": "Bronze",
					"price": 91.0314572295903,
					"status": "inactive",
					"frequency": 0
				}
			},
		{
				"id": "3",
				"type": "subscriptions",
				"attributes": {
					"title": "Student",
					"price": 21.758283638327228,
					"status": "active",
					"frequency": 0
				}
			}
    ]
	}
	```

</details>
<br>

---

<br>