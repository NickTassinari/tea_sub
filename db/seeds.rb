# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
        status: "deactivated",
        frequency: "monthly",
        customer_id: customer_1.id, 
        tea_id: tea_1.id)
    