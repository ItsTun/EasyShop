require 'rails_helper'

RSpec.describe Collection, type: :model do
  it "has a valid factory" do
    shop = FactoryBot.create :user, user_type: 'shop'
    category = FactoryBot.create :category
    collection = FactoryBot.create :collection, shop: shop, category: category
    expect(collection).to be_persisted
  end

  context "validations" do
  end

  describe "relationship associations" do
    before(:example) do
     @shop = FactoryBot.create :user, user_type: 'shop'
     @category = FactoryBot.create :category
     @collection = FactoryBot.create :collection, shop: @shop, category: @category
    end

    it "should has many products" do
      2.times do
        FactoryBot.create :product,
                           collection: @collection,
                           shop: @shop,
                           category: @category
      end
      expect(@collection.products.count).to eq(2)
    end

    it "belongs to shop" do
      collection = FactoryBot.create :collection, shop: @shop, category: @category
      expect(collection.shop).to eq(@shop)
    end

    it "belongs to category" do
      collection = FactoryBot.create :collection, shop: @shop, category: @category
      expect(collection.category).to eq(@category)
    end
  end
end
