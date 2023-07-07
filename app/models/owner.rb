class Owner < ApplicationRecord
    has_many :portfolios, dependent: :destroy
    validates :first_name, :last_name, presence: true
end
