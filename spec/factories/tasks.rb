FactoryBot.define do
  factory :task do
    title { "MyString" }
    detail { "MyText" }
    importance { "" }
    limit { "2022-04-25" }
    user { "" }
  end
end
