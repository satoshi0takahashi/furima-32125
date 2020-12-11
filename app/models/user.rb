class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :birth, presence: true

  with_options presence: true, format: { with: /\A(?:\p{Katakana})+\z/ } do
    validates :first_name_katakana
    validates :last_name_katakana
  end

  with_options presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ } do
    validates :first_name
    validates :last_name
  end

  with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i } do
    validates :password
    validates :password_confirmation, presence: :true
  end
  has_many :items
  has_many :orders
  has_many :comments
end
