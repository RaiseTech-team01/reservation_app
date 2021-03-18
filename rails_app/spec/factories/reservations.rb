FactoryBot.define do
  factory :reservation do
    date_at { "" }
    date_on { "" }
    number_people { "" }
    menu { "MyString" }
    budget { "" }
    inquiry { "MyText" }
    reservation_number { "MyString" }
    user { nil }
    store { nil }
  end
end
