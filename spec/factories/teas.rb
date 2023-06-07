FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Tea.type}
    temperature { Faker::Number.between(from: 170.0..185.0) }
    brew_time { Faker::Number.between(from: 1..10) }
  end
end
