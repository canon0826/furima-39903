class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :shipping_area_id
    validates :shipping_day_id
    validates :price
  end
  
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :shipping_area_id
    validates :shipping_day_id
  end
end