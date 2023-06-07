class CustomerSubscriptionSerializer
  include JSONAPI::Serializer
  attributes :customer_id, :subscription
end
