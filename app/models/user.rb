class User < ApplicationRecord
  has_one :owner, dependent: :destroy
  belongs_to :role, optional: true
  validates :name, presence: true
  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: 'Regular' if role.nil?
  end
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
end
