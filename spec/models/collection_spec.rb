require 'rails_helper'

RSpec.describe Collection, type: :model do
  it "has a valid factory" do
    shop = FactoryBot.create :user, user_type: 'shop'
    collection = FactoryBot.create :collection, shop: shop
    expect(collection).to be_persisted
  end

  context "validations" do
  end

  describe "relationship associations" do
    before(:example) do
     @shop = FactoryBot.create :user, user_type: 'shop'
     @collection = FactoryBot.create :collection, shop: @shop
    end

    it "should has many products" do
      2.times do
        FactoryBot.create :product,
                           collection: @collection,
                           shop: @shop
      end
      expect(@collection.products.count).to eq(2)
    end

    it "belongs to shop" do
      collection = FactoryBot.create :collection, shop: @shop
      expect(collection.shop).to eq(@shop)
    end
  end
end
