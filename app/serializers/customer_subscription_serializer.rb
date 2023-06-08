class CustomerSubscriptionSerializer
  include JSONAPI::Serializer
  attributes :customer_id, :status, :subscription
end
