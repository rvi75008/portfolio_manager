class Portfolio < ApplicationRecord
  belongs_to :owner
  has_many :assets, dependent: :destroy

  validates :name, :currency_id, presence: true
end
