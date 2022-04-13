require 'rails_helper'

RSpec.describe 'customer creation' do
  it 'creates customer' do 
    customer_1 = Customer.create!(first_name: "Karan", last_name: "Mehta", email: "mehtak@gmail.com", address: "2234 South Jefferson")
    tea_1 = Tea.create!(title: "Chai", description: "Milky!", temperature: 100, brew_time: 4)

    subscription_1 = Subscription.create!(tea_id: "#{tea_1.id}", customer_id: "#{customer_1.id}", title: "#{tea_1.title}", status: "active", frequency: "4", price: 4.5)

    post "/api/v1/customers/#{customer_1.id}/subscriptions", params: subscription_1, as: :json

    expect(Subscription.last[:tea_id]).to eq(tea_1.id)

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(201)

    expect(parsed_response).to be_a(Hash)
    expect(parsed_response[:data]).to have_key(:id)
    expect(parsed_response[:data][:attributes]).to have_key(:title)
    expect(parsed_response[:data][:attributes]).to have_key(:status)
    expect(parsed_response[:data][:attributes]).to have_key(:frequency)
    expect(parsed_response[:data][:attributes]).to have_key(:tea_id)
    expect(parsed_response[:data][:attributes]).to have_key(:price)
    expect(parsed_response[:data][:attributes]).to have_key(:customer_id)
  end 
end 