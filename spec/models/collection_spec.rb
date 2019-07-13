require 'rails_helper'

RSpec.describe Collection, type: :model do
  it "has a valid factory" do
    collection = FactoryBot.create :collection
    expect(collection).to be_persisted
  end

  context "validations" do
  end

  describe "relationship associations" do
    before(:example) do
     @collection = FactoryBot.create :collection
     @shop = FactoryBot.create :user, user_type: 'shop'
    end

    it "should has many products" do
      2.times do
        FactoryBot.create :product,
                           collection: @collection,
                           shop: @shop
      end
      expect(@collection.products.count).to eq(2)
    end

    it "should has many shops" do
      2.times do
        FactoryBot.create :shop_collection_map, shop: @shop, collection: @collection
      end
      expect(@collection.shops.count).to eq(2)
    end
  end
end
