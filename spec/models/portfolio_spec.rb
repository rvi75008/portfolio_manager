require 'rails_helper'

RSpec.describe Portfolio, :type => :model do
    let(:owner) { FactoryBot.create (:owner) }
    let(:currency) { FactoryBot.create (:currency) }
  it "is valid with valid attributes" do
    portfolio = Portfolio.new(
        name: "Super Portfolio",
        description: "A portfolio that is super",
        owner: owner,
        currency_id: currency.id,
    )
    expect(portfolio).to be_valid
  end

  it "is not valid without a name" do
    portfolio = Portfolio.new(
        name: nil,
        description: "A portfolio that is super",
        owner: owner,
        currency_id: currency.id,
    )
    expect(portfolio).to_not be_valid
  end
    it "is valid without a description" do
        portfolio = Portfolio.new(
            name: "Super Portfolio",
            description: nil,
            owner: owner,
            currency_id: currency.id,
        )
        expect(portfolio).to be_valid
    end

    it "is not valid without a owner" do
        portfolio = Portfolio.new(
            name: "Super Portfolio",
            description: "A portfolio that is super",
            owner: nil,
            currency_id: currency.id,
        )
        expect(portfolio).to_not be_valid
    end
    it "is not valid without a base currency" do
        portfolio = Portfolio.new(
            name: "Super Portfolio",
            description: nil,
            owner: owner,
        )
        expect(portfolio).to_not be_valid
    end
end
