# Tea Subscription Service

![tea_image](https://cdn.shopify.com/s/files/1/0533/6743/9558/t/5/assets/pf-3c14c005--Tales-of-the-Tea-Pot-3.jpg?v=1621936037)

### Table of Contents
* [App Details](https://github.com/axeldelaguardia/tea_subscription#api-for-a-tea-subscription-service)
* [Endpoints](https://github.com/axeldelaguardia/tea_subscription#endpoints)
* [Data Details](https://github.com/axeldelaguardia/tea_subscription#data-details)

## API for a Tea Subscription Service

This is a Rails API application made with the following features:
- Subscribe a customer to a tea subscription.
- Cancel a customer's tea subscription.
- View all customer's subscription (active or inactive)

**Database Design**
The database tables were designed to accommodate many-to-many relationships between `Customers` and `Subscriptions`, as well as between `Subscriptions` and `Teas`. This means that a `Customer` can have multiple `Subscriptions`, and vice versa. Similarly, `Subscriptions` can include multiple `Teas`, and vice versa.

**Design Choices**
I approached the concept with the understanding that subscriptions are predefined options available for customers to choose from. These options can include various tiers such as start, basic, premium, floral, green, and more. These subscriptions have their own status as there could be "seasonal" subscriptions that are only available during seasons or holidays. I created a status in the CustomerSubscription joint table to associate whether a subscription is active or cancelled to a specific customer. This required to serializer the CustomerSubscription to view the status when retrieving all subscriptions for a certain customer.

### Endpoints

---

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/26407126-0d9a1f53-9fd8-4140-83c9-203fd9843292?action=collection%2Ffork&source=rip_markdown&collection-url=entityId%3D26407126-0d9a1f53-9fd8-4140-83c9-203fd9843292%26entityType%3Dcollection%26workspaceId%3D1c1d2802-273e-42f1-9657-8b8957201060)

#### Customer Subscriptions
<details>
  <summary>Create Customer Subscription</summary>
  
  <br>
  Request:

  ```JS
  POST /api/v1/customers/:customer_id/subscriptions
  ```


  Headers:

  ```JS
  Content-Type: application/json
  ```


  Body: 

  ```JSON
  {
    "id": "1"
  }
  ```

  <br>

  Successful Response: 

  ```JSON
  {
    "data": {
      "id": "1",
      "type": "subscriptions",
      "attributes": {
        "title": "Platinum",
        "price": 98.33,
        "status": "inactive",
        "frequency": 0
      }
    }
  }
  ```
  
  Failed Response (No Customer ID Provided):
  
  ```JSON
  {
    "message": "your query could not be completed",
    "errors": [
      {
        "status": "404",
        "title": "Customer ID must be provided to create a subscription."
      }
    ]
  }
  ```

</details>

<details>
  <summary>Get All Subscriptions for a Customer</summary>
  
  <br>
  Request:

  ```JS
  GET /api/v1/customers/:customer_id/subscriptions
  ```

  Successful Response:
  
  ```JSON
  {
    "data": [
      {
        "id": "1",
        "type": "customer_subscriptions",
        "attributes": {
          "customer_id": 1,
          "subscription": {
            "id": 1
            "title": "Starter",
            "price": 59.5643354788551,
            "status": "inactive",
            "frequency": 2,
            "created_at": "2023-06-07T16:43:21.067Z",
            "updated_at": "2023-06-07T16:43:21.067Z"
          }
        }
      },
      {
        "id": "2",
        "type": "subscriptions",
        "attributes": {
          "customer_id": 1,
          "subscription": {
            "id": 2
            "title": "Basic",
            "price": 91.0314572295903,
            "status": "inactive",
            "frequency": 4,
            "created_at": "2023-06-07T16:43:21.067Z",
            "updated_at": "2023-06-07T16:43:21.067Z"
          }
        }
      },
      {
        "id": "3",
        "type": "subscriptions",
        "attributes": {
          "customer_id": 1,
          "subscription": {
            "id": 3
            "title": "Premium",
            "price": 91.0314572295903,
            "status": "inactive",
            "frequency": 4,
            "created_at": "2023-06-07T16:43:21.067Z",
            "updated_at": "2023-06-07T16:43:21.067Z"
          }
        }
      }
    ]
  }
  ```
  
  Failed Response (No Customer ID Provided):
  
  ```JSON
  {
    "message": "your query could not be completed",
    "errors": [
      {
        "status": "404",
        "title": "Customer ID must be provided to find subscriptions."
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
  PATCH /api/v1/customers/:customer_id/subscriptions/:id
  ```
  
  Body: 

  ```JSON
  {
    "status": "inactive"
  }
  ```
  
  Response:
  | Result | Status |
  | ------ | ------ |
  | `success` | 200 |
  
 </details>
 
<br>

#### Data Details
  
---

<details>
  <summary><b>Tea</b></summary>

  | Attribute | Data Type | Description |
  | ----- | -----| -------------- | 
  | `title` | string | Name of Tea
  | `description` | string | Tea Type
  | `temperature` | float | Measured in Farenheit
  | `brew_time` | integer | Measured in Minutes
</details>

<details>
  <summary><b>Customer</b></summary>

  | Attribute | Data Type | Description |
  | ----- | -----| -------------- | 
  | `first_name` | string | First name of customer
  | `last_name` | string | Last name of customer
  | `email` | string | Valid email address
  | `address` | string | Full address
 </details>

<details>
  <summary><b>Subscription</b></summary>

  | Attribute | Data Type | Description |
  | ----- | -----| -------------- | 
  | `title` | string | Type of Subscription
  | `price` | float | US Currency
  | `status` | integer | enum (active or inactive)
  | `frequency` | integer | Measured in weeks
</details>

<details>
  <summary><b>Customer Subscriptions</b></summary>

  | Attribute | Data Type | Description |
  | ----- | -----| -------------- | 
  | `customer_id` | integer | Foreign Key to Customer
  | `subscription_id` | integer | Foreign Key to Subscription
  | `status` | integer | Status of Customer's Subscription
</details>
  
<details>
  <summary><b>Subscription Teas</b></summary>

  | Attribute | Data Type | Description |
  | ----- | -----| -------------- | 
  | `tea_id` | integer | Foreign Key to Tea
  | `subscription_id` | integer | Foreign Key to Subscription
</details>
  
![database_schema](https://user-images.githubusercontent.com/115383288/244175304-3e80d989-8d5c-469c-81a0-09c3ed34a59e.png)
<br>
