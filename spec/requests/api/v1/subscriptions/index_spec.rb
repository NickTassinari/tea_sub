require "rails_helper"

RSpec.describe "Index Subscriptions API" do 
  it "can list both active and inactive subcriptions" do 
    customer_1 = Customer.create!(first_name: "Nick", last_name: "Tassinari", email: "nick@gmail.com", address: "504 nunya business way")
    tea_1 = Tea.create!(title: "Sencha", description: "Japanese green tea", temperature: "100", brew_time: "3 minutes")
    
    subscription_1 = Subscription.create!( 
        title: "Tea o the Month",
        price: 19.99,
        status: "active",
        frequency: "monthly",
        customer_id: customer_1.id, 
        tea_id: tea_1.id)
    
      subscription_2 = Subscription.create!( 
        title: "More Tea",
        price: 4.00,
        status: "deactived",
        frequency: "monthly",
        customer_id: customer_1.id, 
        tea_id: tea_1.id)
    
    get "/api/v1/customers/#{customer_1.id}/subscriptions"

    expect(response).to have_http_status(200)

    subscriptions = JSON.parse(response.body)
    expect(subscriptions).to be_an(Array)
    expect(subscriptions[0]).to be_a(Hash)
    expect(subscriptions[0]["title"]).to eq("Tea o the Month")
    expect(subscriptions[0]["price"]).to eq(19.99)
    expect(subscriptions[0]["status"]).to eq("active")
    expect(subscriptions[0]["frequency"]).to eq("monthly")
    expect(subscriptions[0]["customer_id"]).to eq(customer_1.id)
    expect(subscriptions[0]["tea_id"]).to eq(tea_1.id)

    expect(subscriptions[1]).to be_a(Hash)
    expect(subscriptions[1]["title"]).to eq("More Tea")
    expect(subscriptions[1]["price"]).to eq(4.00)
    expect(subscriptions[1]["status"]).to eq("deactived")
    expect(subscriptions[1]["frequency"]).to eq("monthly")
    expect(subscriptions[1]["customer_id"]).to eq(customer_1.id)
    expect(subscriptions[1]["tea_id"]).to eq(tea_1.id)
  end
end