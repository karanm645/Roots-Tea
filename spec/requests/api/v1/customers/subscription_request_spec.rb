require 'rails_helper'

RSpec.describe 'subscriptions' do
  it 'cancels subscription' do
    customer_1 = Customer.create!(first_name: "Karan", last_name: "Mehta", email: "mehtak@gmail.com", address: "2234 South Jefferson")
    tea_1 = Tea.create!(title: "Chai", description: "Milky!", temperature: 100, brew_time: 4)

    subscription_1 = Subscription.create!(tea_id: "#{tea_1.id}", customer_id: "#{customer_1.id}", title: "#{tea_1.title}", status: "active", frequency: "4", price: 4.5)

    patch "/api/v1/customers/#{customer_1.id}/subscriptions/#{subscription_1.id}", params: subscription_1, as: :json
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    
    expect(response).to be_successful

    expect(response.status).to eq(200)
    expect(parsed_response).to be_a(Hash)
    expect(parsed_response[:data]).to have_key(:id)
    expect(parsed_response[:data][:attributes]).to have_key(:title)
    expect(parsed_response[:data][:attributes]).to have_key(:status)
    expect(parsed_response[:data][:attributes]).to have_key(:frequency)
    expect(parsed_response[:data][:attributes]).to have_key(:tea_id)
    expect(parsed_response[:data][:attributes]).to have_key(:price)
    expect(parsed_response[:data][:attributes]).to have_key(:customer_id)
  end  

  it 'shows all subscriptions' do 
    customer_1 = Customer.create!(first_name: "Karan", last_name: "Mehta", email: "mehtak@gmail.com", address: "2234 South Jefferson")
    customer_2 = Customer.create!(first_name: "Johnny", last_name: "Appleseed", email: "seed@gmail.com", address: "5469 E Hanover")
    tea_1 = Tea.create!(title: "Chai", description: "Milky!", temperature: 100, brew_time: 4)
    tea_2 = Tea.create!(title: "Green Tea", description: "Smooth!", temperature: 80, brew_time: 2)

    subscription_1 = Subscription.create!(tea_id: "#{tea_1.id}", customer_id: "#{customer_1.id}", title: "#{tea_1.title}", status: "active", frequency: "4", price: 4.5)
    subscription_2 = Subscription.create!(tea_id: "#{tea_1.id}", customer_id: "#{customer_2.id}", title: "#{tea_1.title}", status: "active", frequency: "3", price: 2.5)
    subscription_3 = Subscription.create!(tea_id: "#{tea_2.id}", customer_id: "#{customer_1.id}", title: "#{tea_2.title}", status: "inactive", frequency: "8", price: 5)

    get "/api/v1/customers/#{customer_1.id}/subscriptions"
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(parsed_response).to be_an(Array)
    expect(parsed_response[0]).to have_key(:data)
    expect(parsed_response[0][:data]).to have_key(:id)
    expect(parsed_response[0][:data]).to have_key(:attributes)
    expect(parsed_response[0][:data][:attributes]).to have_key(:customer_id)
    expect(parsed_response[0][:data][:attributes]).to have_key(:tea_id)
    expect(parsed_response[0][:data][:attributes]).to have_key(:title)
    expect(parsed_response[0][:data][:attributes]).to have_key(:price)
    expect(parsed_response[0][:data][:attributes]).to have_key(:status)
    expect(parsed_response[0][:data][:attributes]).to have_key(:frequency)
  end 

  describe 'sad path' do 
    it 'returns a 404 if user inputs bad id' do 
      customer_1 = Customer.create!(first_name: "Karan", last_name: "Mehta", email: "mehtak@gmail.com", address: "2234 South Jefferson")
      tea_1 = Tea.create!(title: "Chai", description: "Milky!", temperature: 100, brew_time: 4)
      subscription_1 = Subscription.create!(tea_id: "#{tea_1.id}", customer_id: "#{customer_1.id}", title: "#{tea_1.title}", status: "active", frequency: "4", price: 4.5)
      
      post "/api/v1/customers/#{customer_1.id}/subscriptions/", params: { title: 'test', price: 5, status: "active", frequency: 2, customer_id: customer_1.id, tea_id: tea_1.id }
      patch "/api/v1/customers/#{customer_1.id}/subscriptions/58772266333", params: subscription_1, as: :json
      
      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end 
  end 
end 