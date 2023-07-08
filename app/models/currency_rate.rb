class CurrencyRate < ApplicationRecord
    belongs_to :base_currency, class_name: "Currency"
    belongs_to :target_currency, class_name: "Currency"
  
    validates :base_currency, presence: true
    validates :target_currency, presence: true
    validates :rate, presence: true
end