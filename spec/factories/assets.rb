FactoryBot.define do
  factory :asset do
    name { "MyString" }
    currency { "MyString" }
    quantity { 1.5 }
    unit_price { 1.5 }
    unit_purchasing_price { 1.5 }
    account { "MyString" }
    type { "" }
    ticker { "MyString" }
    sector { "MyString" }
    sub_sector { "MyString" }
  end
end
