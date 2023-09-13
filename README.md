# Tea_Sub 

## About This Project
This is a Back End Rest API project modeled after a take home project from an interview. It has 3 endpoints currently that can create, cancel and list subscriptions belonging to customers.


## This Project Utilizes 

* ![Ruby](https://img.shields.io/badge/Ruby-red)
* ![Rails](https://img.shields.io/badge/Rails-red)
* ![PostGresql](https://img.shields.io/badge/PostGresql-purple)
* ![VisualCodeStudio](https://img.shields.io/badge/VSCode-pink)
* ![Postman Badge](https://img.shields.io/badge/Postman-FF6C37?logo=postman&logoColor=fff&style=for-the-badge)

## Running On
- Ruby 2.7.2
- Rails 5.2.8

## Getting Started 
### Installation 
1. Fork the Project
2. Clone Repo 

```git clone git@github.com:NickTassinari/tea_sub.git```

3. Install gems 

```bundle install```


5. Make Database 

```rails db:{create,migrate}```

## Endpoints Used 
<div style="overflow: auto; height: 200px;">
  <pre>
    <code>

      POST "/api/v1/customers/#{customer_1.id}/subscriptions", params: subscription_params

       subscription_params = { 
        subscription: {
          title: "Tea o the Month",
          price: 19.99,
          status: "active",
          frequency: "monthly",
          customer_id: customer_1.id, 
          tea_id: tea_1.id
          }
        }

        
      GET "api/v1/customers/:customer_id/subscriptions" 
        - this will list all subscriptions active and inactive belonging to the identified customer. The response should look like this
      [
      {
          "id": 1,
          "title": "Tea o the Month",
          "price": 19.99,
          "status": "active",
          "frequency": "monthly",
          "customer_id": 1,
          "created_at": "2023-09-13T17:32:21.887Z",
          "updated_at": "2023-09-13T17:32:21.887Z",
          "tea_id": 1
      },
      {
          "id": 2,
          "title": "More Tea",
          "price": 4.0,
          "status": "deactivated",
          "frequency": "monthly",
          "customer_id": 1,
          "created_at": "2023-09-13T17:32:21.893Z",
          "updated_at": "2023-09-13T17:32:21.893Z",
          "tea_id": 1
      }
      ]

      DELETE "/api/v1/customers/#{customer_1.id}/subscriptions/#{subscription_1.id}"
        The response should be a 204 status and the subscription will have it's status changed from "active" to "deactivated".



  </pre>
</div>

## Schema
```
  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "title"
    t.float "price"
    t.string "status"
    t.string "frequency"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tea_id"
    t.index ["customer_id"], name: "index_subscriptions_on_customer_id"
    t.index ["tea_id"], name: "index_subscriptions_on_tea_id"
  end

  create_table "teas", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "temperature"
    t.string "brew_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "subscriptions", "customers"
  add_foreign_key "subscriptions", "teas"
```


## Author

- Nick Tassinari [![Github](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/NickTassinari)[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/tassinarinicholas/)