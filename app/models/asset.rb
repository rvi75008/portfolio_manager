class Asset < ApplicationRecord
    belongs_to :portfolio
    belongs_to :currency
    validates :name, :currency, :quantity, :unit_price,
     :unit_purchasing_price, :asset_type, presence: true
end
