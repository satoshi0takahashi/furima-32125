FactoryBot.define do
  factory :user do
    id { Faker::Number.between(from: 2, to: 10) }
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name { Gimei.first.kanji }
    last_name { Gimei.last.kanji }
    first_name_katakana { Gimei.first.katakana }
    last_name_katakana { Gimei.last.katakana }
    birth { Faker::Date.birthday }
  end
end
