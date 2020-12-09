FactoryBot.define do
  factory :item do
    name { Faker::Name.initials(number: 2) }
    detail { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    status_id { Faker::Number.between(from: 2, to: 7) }
    shipping_change_id { Faker::Number.between(from: 2, to: 3) }
    shipping_area_id { Faker::Number.between(from: 2, to: 48) }
    day_to_ship_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/staff1.jpg'), filename: 'staff1.jpg')
    end
  end
end
