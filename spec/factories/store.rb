FactoryBot.define do
  factory :store do
    name { Faker::Name.name }
    sequence(:email) {|n| "#{n}_#{Faker::Internet.email}" }
    password { Faker::Internet.password(min_length: 8, max_length: 32, mix_case: true, special_characters: true) }
    furigana { Gimei.name.katakana }
    tel { Faker::Bank.account_number(digits: 12) }
    fax { Faker::Bank.account_number(digits: 12) }
    postal_code { Faker::Number.number(digits: 7) }
    address { Gimei.address.town.kanji }
    url { "https://sample.com" }
    seat { Faker::Number.number(digits: 3) }
    restaurant { "飲食" }
    genre { Faker::Food.dish }
    responsible_party { Faker::Name.name }
  end
end
