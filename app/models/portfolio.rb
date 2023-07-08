class Portfolio < ApplicationRecord
  belongs_to :owner
  
  validates :name, :currency_id, presence: true
end
