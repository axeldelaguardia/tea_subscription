FactoryBot.define do
  factory :subscription do
    title { Faker::Subscription.plan }
    price { Faker::Number.within(range: 10.0..100.0) }
    status { Faker::Number.within(range: 0..1) }
    frequency { Faker::Subscription.payment_term }

		trait :active do
			status { 1 }
		end

		trait :inactive do
			status { 0 }
		end
  end
end
