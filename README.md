# Roots-Tea
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-this-project">About This Project</a>
      <ul>
        <li>
          <a href="#learning-goals-of-project">Learning Goals of Project</a>
        </li>
      </ul>
      <ul>
        <li><a href="#versions">Versions</a></li>
      </ul>
      <ul>
        <li><a href="#important-gems">Important Gems</a></li>
      </ul>
      <ul>
        <li><a href="#database-design">Database design</a></li>
      </ul>
      <ul>
        <li><a href="#local-setup">Local Setup</a></li>
      </ul>
    <li><a href="#endpoints">Endpoints</a>
      <ul>
      <li><a href="#overview">Overview</a></li>
      </ul>
    </li>
  </ol>
</details>
 
## About This Project
This is a back-end project to connect customers to a tea subscription service. The endpoints created will subscribe a customer, cancel a subscription, and show all subscriptions pertaining to the customer.
  
  
### Learning Goals of Project 
As a takehome challenge, my goal is to create an API (time limit 8 hours) for front-end developers to consume.

### Versions

- Ruby 2.7.2

- Rails 5.2.6

### Important Gems
Testing: [rspec-rails](https://github.com/rspec/rspec-rails), [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers), [simplecov](https://github.com/simplecov-ruby/simplecov)
 
API: [jsonapi-serializer](https://github.com/fotinakis/jsonapi-serializers)

### Database Design
![image](https://user-images.githubusercontent.com/79548116/163052324-f299fdb3-f3b1-4ace-98be-76bec1c941a9.png)

### Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:create`
4. Run migrations: ` rails db:migrate`

## Endpoints 
All endpoints can be viewed by running the `rails server` command in your terminal. In your browswer, type in `http://localhost:3000/{endpoint_get_request}`

### Overview
| Request Type  | URI           |  
| ------------- | ------------- |
| GET  |  /api/v1/customers/:id/subscriptions  |
| POST | /api/v1/customers/:id/subscriptions |
| PATCH | /api/v1/customers/:id/subscriptions/:id | 

Request: 
```ruby 
GET /api/v1/customers/:id/subscriptions
``` 

Response: 
```ruby 
[
    {
        "data": {
            "type": "subscriptions",
            "id": 1,
            "attributes": {
                "customer_id": 1,
                "tea_id": 1,
                "title": "Chai",
                "price": 4,
                "status": "active",
                "frequency": 4
            }
        }
    },
    {
        "data": {
            "type": "subscriptions",
            "id": 2,
            "attributes": {
                "customer_id": 1,
                "tea_id": 2,
                "title": "Green Tea",
                "price": 4,
                "status": "active",
                "frequency": 4
            }
        }
    },
    {
        "data": {
            "type": "subscriptions",
            "id": 3,
            "attributes": {
                "customer_id": 1,
                "tea_id": 3,
                "title": "Mocha",
                "price": 4,
                "status": "inactive",
                "frequency": 4
            }
        }
    }
]
```
Request: 
```ruby 
POST /api/v1/customers/:id/subscriptions
{
    "title": "John Smith",
    "price": 15,
    "status": "active",
    "frequency": 2,
    "customer_id": 1,
    "tea_id": 1
}
``` 

Response: 
```ruby 
{
    "data": {
        "type": "subscriptions",
        "id": 4,
        "attributes": {
            "customer_id": 1,
            "tea_id": 1,
            "title": "John Smith",
            "price": 15,
            "status": "active",
            "frequency": 2
        }
    }
}
```
Request: 
```ruby 
PATCH /api/v1/customers/:id/subscriptions/:id

body:

{
    "title": "new",
    "price": 5,
    "status": "active",
    "frequency": 2,
    "customer_id": 1,
    "tea_id": 1
}
```

Response: 
```ruby 
{
    "data": {
        "type": "subscriptions",
        "id": 1,
        "attributes": {
            "customer_id": 1,
            "tea_id": 1,
            "title": "Chai",
            "price": 4,
            "status": "inactive",
            "frequency": 4
        }
    }
}
```

## Running the tests

Run `bundle exec rspec` to run the test suite
