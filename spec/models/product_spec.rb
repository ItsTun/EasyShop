require 'rails_helper'

RSpec.describe Product, type: :model do
  it "has a valid factory" do
    shop = FactoryBot.create :user, user_type: 'shop'
    collection = FactoryBot.create :collection, shop: shop
    product = FactoryBot.create :product, shop: shop, collection: collection
    expect(product).to be_persisted
  end

  context "validations" do
  end

  describe "relationship associations" do
    before(:example) do
     @shop = FactoryBot.create :user, user_type: 'shop'
     @collection = FactoryBot.create :collection, shop: @shop
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
      product = FactoryBot.create :product, collection: @collection, shop: @shop
      2.times do
        product.images.attach(io: File.new(Rails.root.join('public', 'test.png')), filename: 'test.png')
      end
      expect(product.images.count).to eq(2)
    end

    it "should has many discounts" do
      discount = FactoryBot.create :discount
      product = FactoryBot.create :product, shop: @shop, collection: @collection
      2.times do
        FactoryBot.create :discount_product_map, discount: discount, product: product
      end
      expect(product.discounts.count).to eq(2)
    end
  end
end
