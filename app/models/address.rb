class Address < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :postal_code
    validates :shipping_area_id
    validates :city
    validates :address
    validates :phone_number
  end
end
