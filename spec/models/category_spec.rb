require 'rails_helper'

RSpec.describe Category, type: :model do
  it "has a valid factory" do
    category = FactoryBot.create :category
    expect(category).to be_persisted
  end

  context "validations" do
  end

  describe "relationship associations" do
    before(:example) do
     @shop = FactoryBot.create :user, user_type: 'shop'
     @category = FactoryBot.create :category
    end

    it "has many collections" do
      2.times do
        FactoryBot.create :collection, shop: @shop, category: @category
      end
      expect(@category.collections.count).to eq(2)

    end

    it "has many products" do
      collection = FactoryBot.create :collection, shop: @shop, category: @category
      2.times do
        FactoryBot.create :product,
                          collection: collection,
                          shop: @shop,
                          category: @category
      end
      expect(@category.products.count).to eq(2)

    end
  end
end
