class OrderForm
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :postal_code, :shipping_area_id, 
                :city, :address, :building_name, :phone_number, :purchase_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)'}
    validates :shipping_area_id, numericality: { other_than: 0, message: 'can't be blank'} 
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/,message: 'is invalid. Do not Include hyphen(-)'}
  end
end