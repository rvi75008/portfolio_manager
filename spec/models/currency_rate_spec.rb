require 'rails_helper'

RSpec.describe CurrencyRate, type: :model do
  describe "associations" do
    it { should belong_to(:base_currency).class_name("Currency") }
    it { should belong_to(:target_currency).class_name("Currency") }
  end

  describe "validations" do
    it { should validate_presence_of(:base_currency) }
    it { should validate_presence_of(:target_currency) }
    it { should validate_presence_of(:rate) }
  end
end
