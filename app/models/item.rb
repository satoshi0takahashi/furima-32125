class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :detail
    validates :image
  end
  validates :price, presence: true, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :day_to_ship
  belongs_to_active_hash :shipping_change
  belongs_to_active_hash :shipping_area

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_change_id
    validates :shipping_area_id
    validates :day_to_ship_id
  end
end
