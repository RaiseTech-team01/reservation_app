FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    sequence(:email) {|n| "#{n}_#{Faker::Internet.email}" }
    password { Faker::Internet.password(min_length: 8, max_length: 32, mix_case: true, special_characters: true) }
    furigana { Gimei.name.katakana }
    image { "" }
    tel { Faker::Bank.account_number(digits: 12) }
    birthday { Faker::Code.npi }
    gender { "gender" }
    address { Gimei.address.town.kanji }
  end
end
