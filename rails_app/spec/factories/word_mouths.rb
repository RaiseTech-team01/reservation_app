FactoryBot.define do
  factory :word_mouth do
    visit_day { "" }
    title { "MyString" }
    body { "MyText" }
    user { nil }
    store { nil }
  end
end
