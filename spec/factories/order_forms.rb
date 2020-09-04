FactoryBot.define do
  factory :order_form do
    token           { 'response.id' }
    postal_code     { '111-2222' }
    city            { '西宮市' }
    house_number    { '1-2-3' }
    phone_number    { '12312341234' }
    prefectures_id  { 3 }
  end
end
