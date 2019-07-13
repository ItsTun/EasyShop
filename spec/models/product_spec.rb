require 'rails_helper'

RSpec.describe Product, type: :model do
  it "has a valid factory" do
    product = FactoryBot.create :product
    expect(product).to be_persisted
  end

  context "validations" do
  end

  describe "relationship associations" do
    before(:example) do
     @collection = FactoryBot.create :collection
     @shop = FactoryBot.create :user, user_type: 'shop'
    end

    it "should belongs to collection" do
      product = FactoryBot.create :product,
                                  collection: @collection,
                                  shop: @shop
      expect(product.collection).to eq(@collection)

    end

    it "should belongs to shop" do
      product = FactoryBot.create :product,
                                  collection: @collection,
                                  shop: @shop
      expect(product.shop).to eq(@shop)
    end

    it "should has many images" do
      product = FactoryBot.create :product,
                                  collection: @collection,
                                  shop: @shop
      2.times do
        FactoryBot.create :image,
                           product: product
      end
      expect(product.images.count).to eq(2)
    end
  end
end
