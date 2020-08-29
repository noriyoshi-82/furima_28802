FactoryBot.define do
  factory :item do
    name             { Faker::Name.initials(number: 4) }
    text             { Faker::Lorem.sentence }
    price            { 10000 }
    category_id      { 1 }
    condition_id     { 1 }
    delivery_pay_id  { 1 }
    prefectures_id   { 1 }
    delivery_day_id  { 1 }
    association :user
  end
end