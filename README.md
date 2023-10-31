# Tea Subscription API

## API Use cases
This API allows customers to manage their tea subcriptions and access tea subscription information by:

- subscribing
- cancelling subscriptions
- viewing all active/cancelled subscriptions

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
        "status": "cancelled",
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
      "status": "cancelled",
      "frequency": "monthly",
      "tea_id": 1,
      "customer_id": 1
    }
  }
}
```

## Schema

![Database Structure](https://github.com/DChavez18/tea_api/blob/main/Tea%20Subscription%20Schema.png)


