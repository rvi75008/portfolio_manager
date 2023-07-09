FactoryBot.define do
    factory :portfolio do
        name { "Portaf" }
        description { "A portfolio that is super" }
        owner { FactoryBot.create(:owner) }
        currency_id { FactoryBot.create(:currency).id }
    end
end
