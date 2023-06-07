# Tea Subscription Service

![tea_image](https://cdn.shopify.com/s/files/1/0533/6743/9558/t/5/assets/pf-3c14c005--Tales-of-the-Tea-Pot-3.jpg?v=1621936037)
## API for a Tea Subscription Service

This is a Rails API application made with the following features:
- Subscribe a customer to a tea subscription.
- Cancel a customer's tea subscription.
- View all customer's subscription (active or inactive)

### Endpoints

---

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/26407126-0d9a1f53-9fd8-4140-83c9-203fd9843292?action=collection%2Ffork&source=rip_markdown&collection-url=entityId%3D26407126-0d9a1f53-9fd8-4140-83c9-203fd9843292%26entityType%3Dcollection%26workspaceId%3D1c1d2802-273e-42f1-9657-8b8957201060)

#### Customer Subscriptions
<details>
  <summary>Create Customer Subscription</summary>
  
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
  <summary>Get All Subscriptions for a Customer</summary>
  
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
          "frequency": 2
        }
      },
      {
        "id": "2",
        "type": "subscriptions",
        "attributes": {
          "title": "Bronze",
          "price": 91.0314572295903,
          "status": "inactive",
          "frequency": 4
        }
      },
        {
        "id": "3",
        "type": "subscriptions",
        "attributes": {
          "title": "Student",
          "price": 21.758283638327228,
          "status": "active",
          "frequency": 2
        }
      }
    ]
  }
  ```

</details>

<details>
  <summary>Cancel a Customer's Subscription</summary>
  
  <br>
  Request:
  
  ```JS
  POST /api/v1/customer_subscriptions/:id
  ```
  
  Response:
  | Result | Status |
  | ------ | ------ |
  | Success | 204 |
  
 </details>
 
<br>

#### Considerations
  
---
  

<br>
