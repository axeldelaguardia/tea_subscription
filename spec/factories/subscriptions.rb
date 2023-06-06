FactoryBot.define do
  factory :subscription do
    title { Faker::Subscription.plan }
    price { Faker::Number.between(from: 10..100) }
    status { Faker::Number.between(from: 1, to: 3) }
    frequency { Faker::Subscription.payment_term }

		trait :active do
			status { 1 }
		end

		trait :inactive do
			status { 0 }
		end
  end
end
