FactoryBot.define do
  factory :order_form do

    postal_code { '123-4567' }
    shipping_area_id { 1 }
    city { '横浜市緑区' }
    address { '1-1' }
    building_name { '柳ビル103' }
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
