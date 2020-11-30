class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :nickname, presence: true
         validates :first_name, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}
         validates :last_name, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}
         validates :first_name_katakana, presence: true, format: { with: /\A(?:\p{Katakana})+\z/}
         validates :last_name_katakana, presence: true, format: { with: /\A(?:\p{Katakana})+\z/}
         validates :birth, presence: true
         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]{8,32}+\z/
         validates :password, format: { with: VALID_PASSWORD_REGEX}, length: { minimum: 6 }
end