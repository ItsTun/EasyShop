require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it "has a valid factory" do
    shop = FactoryBot.create :user, user_type: 'shop'
    pricing = FactoryBot.create :pricing
    transaction = FactoryBot.create :transaction, user: shop, pricing: pricing
    expect(transaction).to be_persisted
  end

  context "validations" do
  end

  describe "relationship associations" do
    before(:example) do
    @shop = FactoryBot.create :user, user_type: 'shop'
    @pricing = FactoryBot.create :pricing
    @transaction = FactoryBot.create :transaction, user: @shop, pricing: @pricing
    end

    it "belongs to user" do
      expect(@transaction.user).to eq(@shop)
    end

    it "belongs to pricing" do
      expect(@transaction.pricing).to eq(@pricing)
    end
  end
end
