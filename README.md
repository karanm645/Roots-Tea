# ![image](https://user-images.githubusercontent.com/79548116/163462417-db8da35a-6282-422e-a34c-33c6ba0dd233.png)

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
5. Create seeds: ` rails db:seed`

## Endpoints
All endpoints can be viewed by running the `rails server` command in your terminal. In your browswer, type in `http://localhost:3000/{endpoint_get_request}`

### Overview
| Request Type  | URI          |  Details |
| ------------- | ------------- |  --------  |      
| GET  |  /api/v1/customers/:id/subscriptions     | All of the customer's subscriptions can be seen |
| POST | /api/v1/customers/:id/subscriptions      | A new subscription can be created |              
| PATCH | /api/v1/customers/:id/subscriptions/:id | A subscription can be cancelled  |               

### Show all tea subscriptions the customer has signed up for
Request: 
```ruby 
GET /api/v1/customers/:id/subscriptions
* No body required
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
### Create a new tea subscription for customer
Request: 
```ruby 
POST /api/v1/customers/:id/subscriptions

body:

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
### Unsubscribe the customer from the subscription
Request: 
```ruby 
PATCH /api/v1/customers/:id/subscriptions/:id
* No body requred
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
