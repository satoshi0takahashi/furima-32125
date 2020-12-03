class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :day_to_ship
  belongs_to_active_hash :shipping_change
  belongs_to_active_hash :shipping_area

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_change_id
    validates :shipping_area_id
    validates :day_to_ship_id
  end
end
