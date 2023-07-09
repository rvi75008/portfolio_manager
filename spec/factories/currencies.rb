FactoryBot.define do
  factory :currency do
    id { |n| n}
    code { |n| "MyString#{n}" }
    name { "MyString" }
    symbol { "MyString" }
  end
end
