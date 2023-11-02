# Tea Subscription API

## About the API

Welcome to the Tea Subscription API, a simple yet powerful Rails API built to manage tea subscriptions for customers. Whether you're a tea enthusiast or a developer exploring this service, here's what you can expect:

### Key Features:

- **Subscription Management:** You can easily subscribe customers to tea subscriptions, helping them enjoy their favorite blends hassle-free.

- **Cancellation Made Easy:** We provide an endpoint for canceling tea subscriptions, ensuring flexibility and convenience for customers.

- **Comprehensive Subscription Overview:** With our service, customers can view all their subscriptions, both active and canceled, in one place.

### Why This Matters:

Our API is designed to demonstrate strong proficiency in Rails development, emphasizing RESTful routes and organized code following object-oriented programming principles. We've also prioritized Test Driven Development (TDD) to ensure the robustness of our service. Clear and concise documentation is provided for ease of use.

## Runs With
- Rails 7.0.6
- Ruby 3.2.2

## How to Use

1. Fork the Project
2. Clone the repo

```
git clone git@github.com:DChavez18/tea_api.git
```
Run bundle install

Run rails db:{create,migrate,seed}

## JSON Contract

### GET api/v1/customers/:customer_id/subscriptions
**Status**: 200 OK

```json
{
  "data": [
    {
      "id": "1",
      "type": "subscription",
      "attributes": {
        "title": "Earl Grey",
        "price": 10.0,
        "status": "active",
        "frequency": "monthly",
        "tea_id": 1,
        "customer_id": 1
      }
    },
    {
      "id": "2",
      "type": "subscription",
      "attributes": {
        "title": "Green Tea",
        "price": 10.0,
        "status": "canceled",
        "frequency": "monthly",
        "tea_id": 2,
        "customer_id": 1
      }
    }
  ]
}
```
### POST api/v1/customers/:customer_id/subscriptions
**Status**: 201 Created

**Request:**
```json
{
  "title": "Bedtime",
  "price": 18.99,
  "status": "active",
  "frequency": "weekly",
  "customer_id": 1,
  "tea_id": 2
}
```
**Response:**
```json
{
  "data": {
    "id": "4",
    "type": "subscription",
    "attributes": {
      "title": "Bedtime",
      "price": 18.99,
      "status": "active",
      "frequency": "weekly",
      "tea_id": 2,
      "customer_id": 1
    }
  }
}
```

### PATCH api/v1/customers/:customer_id/subscriptions/:subscription_id/cancel
**Status**: 200 OK
```json
{
  "data": {
    "id": "1",
    "type": "subscription",
    "attributes": {
      "title": "Earl Grey",
      "price": 10.0,
      "status": "canceled",
      "frequency": "monthly",
      "tea_id": 1,
      "customer_id": 1
    }
  }
}
```

## Schema

![Database Structure](https://github.com/DChavez18/tea_api/blob/main/Tea%20Subscription%20Schema.png)

## Project Board
[Figma](https://www.figma.com/file/iAx6SOQy8G1eciIMdKvOOE/Untitled?type=design&node-id=0-1&mode=design&t=QOc3SpX0OBZMYHXE-0)

## Contact

Derek Chavez [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white) ](https://github.com/DChavez18) [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white) ](https://www.linkedin.com/in/derek-chavez/)
