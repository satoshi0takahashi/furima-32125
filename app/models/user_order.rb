class UserOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :city, :address, :building, :phone_number, :token, :user_id, :item_id, :order_id

  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }

  with_options presence: true do
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]+\z/ }, length: {minimum: 11}
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id, token: token)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end