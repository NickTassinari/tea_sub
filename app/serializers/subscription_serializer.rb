class SubscriptionSerializer 
  include JSONAPI::Serializer
  attributes :frequency, :status, :title, :price, :customer_id, :tea_id, :created_at, :updated_at
end