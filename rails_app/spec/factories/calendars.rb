FactoryBot.define do
  factory :calendar do
    business_hours { "MyString" }
    regular_holiday { "MyString" }
    title { "MyString" }
    body { "MyText" }
    store { nil }
  end
end
