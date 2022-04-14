# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
Customer.destroy_all
Tea.destroy_all
Subscription.destroy_all
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
    customer_1 = Customer.create!(first_name: "Karan", last_name: "Mehta", email: "mehtak@gmail.com", address: "2234 South Jefferson")
    tea_1 = Tea.create!(title: "Chai", description: "Milky!", temperature: 100, brew_time: 4)
    tea_2 = Tea.create!(title: "Green Tea", description: "Fresh!", temperature: 120, brew_time: 8)
    tea_3 = Tea.create!(title: "Mocha", description: "Creamy!", temperature: 75, brew_time: 2)
    subscription_1 = Subscription.create!(tea_id: "#{tea_1.id}", customer_id: "#{customer_1.id}", title: "#{tea_1.title}", status: "active", frequency: "4", price: 4.5)
    subscription_2 = Subscription.create!(tea_id: "#{tea_2.id}", customer_id: "#{customer_1.id}", title: "#{tea_2.title}", status: "active", frequency: "4", price: 4.5)
    subscription_3 = Subscription.create!(tea_id: "#{tea_3.id}", customer_id: "#{customer_1.id}", title: "#{tea_3.title}", status: "inactive", frequency: "4", price: 4.5)
