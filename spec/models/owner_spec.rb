require 'rails_helper'

RSpec.describe Owner, :type => :model do
  it "is valid with valid attributes" do
    owner = Owner.new(first_name: "John", last_name: "Doe")
    expect(owner).to be_valid
  end

  it "is not valid without a first_name" do
    owner = Owner.new(first_name: nil, last_name: "Doe")
    expect(owner).to_not be_valid
  end
  it "is not valid without a last_name" do
    owner = Owner.new(first_name: "John", last_name: nil)
    expect(owner).to_not be_valid
  end
end
