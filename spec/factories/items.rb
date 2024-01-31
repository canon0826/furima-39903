FactoryBot.define do
  factory :item do
    association :user

    name { 'Example Item' }
    description { 'This is an example item.' }
    category_id { Faker::Number.between(from: 2, to: 10) }
    condition_id { 2 }
    shipping_fee_id { Faker::Number.between(from: 2, to: 2) }
    shipping_area_id { Faker::Number.between(from: 2, to: 47) }
    shipping_day_id { Faker::Number.between(from: 2, to: 3) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end