FactoryBot.define do
  factory :user_order do
    postal_code { '123-4567' }
    shipping_area_id { Faker::Number.between(from: 2, to: 48) }
    city { Gimei.address.city.kanji }
    address { Faker::Number.between(from: 2, to: 48) }
    building { Gimei.town.kanji  }
    phone_number { 123 }
    token { 'tok_abcdefghijk00000000000000000' }

  end
end
