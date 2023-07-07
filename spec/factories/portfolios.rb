FactoryBot.define do
    factory :portfolio do
        name { "Portaf" }
        description { "A portfolio that is super" }
        owner { FactoryBot.create(:owner) }
    end
end