class SubscriptionsSerializer
  include JSONAPI::Serializer
  attributes :title, :price, :status, :frequency
end
