FactoryBot.define do
  factory :subscription_tea do
    association :tea
    association :subscription
  end
end
