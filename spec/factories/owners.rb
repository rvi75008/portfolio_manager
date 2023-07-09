FactoryBot.define do
    factory :owner do
        first_name { |n| "John #{n}" }
        last_name { "Doe" }
    end
end
