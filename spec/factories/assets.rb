FactoryBot.define do
  factory :asset do
    id { |n| n}
    name { |n| "MyString #{n}" }
    currency_id { FactoryBot.create(:currency).id }
    portfolio_id { FactoryBot.create(:portfolio).id}
    quantity { 1.5 }
    unit_price { 1.5 }
    unit_purchasing_price { 1.5 }
    account { "MyString" }
    asset_type { "Stock" }
    ticker { "MyString" }
    sector { "MyString" }
    sub_sector { "MyString" }
  end
end
