require 'rails_helper'

RSpec.describe Asset, type: :model do
  describe "associations" do
    it { should belong_to(:portfolio) }
    it { should belong_to(:currency) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:currency) }
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:unit_price) }
    it { should validate_presence_of(:unit_purchasing_price) }
    it { should validate_presence_of(:type) }
  end
end