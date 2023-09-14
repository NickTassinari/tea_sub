require "rails_helper"

RSpec.describe "Cancel Subscriptions API" do 
  it "can cancel a subscription" do 
    customer_1 = Customer.create!(first_name: "Nick", last_name: "Tassinari", email: "nick@gmail.com", address: "504 nunya business way")
    tea_1 = Tea.create!(title: "Sencha", description: "Japanese green tea", temperature: "100", brew_time: "3 minutes")
    
    subscription_1 = Subscription.create!( 
        title: "Tea o the Month",
        price: 19.99,
        status: "active",
        frequency: "monthly",
        customer_id: customer_1.id, 
        tea_id: tea_1.id)
    
    patch "/api/v1/customers/#{customer_1.id}/subscriptions/#{subscription_1.id}"
    
    expect(response).to have_http_status(204)

    subscription_1.reload
    
    expect(subscription_1.status).to eq("deactivated")
  end 
end 