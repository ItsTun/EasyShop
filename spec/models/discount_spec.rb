require 'rails_helper'

RSpec.describe Collection, type: :model do
  it "has a valid factory" do
    discount = FactoryBot.create :discount
    expect(discount).to be_persisted
  end

  context "validations" do
  end

  describe "relationship associations" do
    before(:example) do
     @shop = FactoryBot.create :user, user_type: 'shop'
    end

    it "belongs to shop" do
      discount = FactoryBot.create :discount, shop: @shop
      expect(discount.shop).to eq(@shop)
    end
  end
end
