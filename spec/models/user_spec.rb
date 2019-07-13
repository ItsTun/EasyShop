require 'rails_helper'

RSpec.describe Discount, type: :model do
  it "has a valid factory" do
    user = FactoryBot.create :user
    expect(user).to be_persisted
  end

  context "validations" do
  end

  describe "relationship associations" do
    before(:example) do
     @user1 = FactoryBot.create :user, user_type: 'customer'
     @user2 = FactoryBot.create :user, user_type: 'customer'
     @shop = FactoryBot.create :user, user_type: 'shop'
     @collection = FactoryBot.create :collection
    end

    it "should has one user order if user is customer" do
      expect(@user1.user_order).to eq(@order1)
    end

    it "should has many shop orders if user is shop" do
      FactoryBot.create :order, user: @user1, shop: @shop
      FactoryBot.create :order, user: @user2, shop: @shop
      expect(@shop.shop_orders.count).to eq(2)
    end

    it "should has many products" do
      2.times do
        FactoryBot.create :product,
                           collection: @collection,
                           shop: @shop
      end
      expect(@shop.products.count).to eq(2)
    end

    it "should has many discounts" do
      2.times do
        FactoryBot.create :discount,
                          shop: @shop
      end
      expect(@shop.discounts.count).to eq(2)
    end

    it "should has many user roles" do
      @user1.add_role :admin
      expect(@user1.roles.count).to eq(2)
    end
  end
end
