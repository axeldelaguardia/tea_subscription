FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Tea.type}
    temperature { Faker::Number.within(range: 170.0..185.0).round(2) }
    brew_time { Faker::Number.within(range: 1..10) }
  end
end
