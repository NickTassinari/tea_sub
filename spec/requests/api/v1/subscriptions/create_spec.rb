require "rails_helper"

RSpec.describe "Create Subscriptions API" do 
  it "can create a new subscription" do 
    customer_1 = Customer.create!(first_name: "Nick", last_name: "Tassinari", email: "nick@gmail.com", address: "504 nunya business way")
    tea_1 = Tea.create!(title: "Sencha", description: "Japanese green tea", temperature: "100", brew_time: "3 minutes")
    
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
    post "/api/v1/customers/#{customer_1.id}/subscriptions", params: subscription_params

    expect(response).to have_http_status(201)

    subscription = JSON.parse(response.body)
    expect(subscription["title"]).to eq("Tea o the Month")
    expect(subscription["price"]).to eq(19.99)
    expect(subscription["status"]).to eq("active")
    expect(subscription["frequency"]).to eq("monthly")
  end
end