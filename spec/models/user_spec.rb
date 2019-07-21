require 'rails_helper'

RSpec.describe Discount, type: :model do
  it "has a valid factory" do
    user = FactoryBot.create :user
    expect(user).to be_persisted
  end

  let(:subscriber_ids) {
    subscriber_ids = []
    subscriber_ids << (FactoryBot.create :user, user_type: 'user').id
    subscriber_ids << (FactoryBot.create :user, user_type: 'user').id
  }

  context "validations" do
  end

  describe "relationship associations" do
    before(:example) do
     @user1 = FactoryBot.create :user, user_type: 'customer'
     @user2 = FactoryBot.create :user, user_type: 'customer'
     @shop = FactoryBot.create :user, user_type: 'shop'
     @pricing = FactoryBot.create :pricing
     @delivery = FactoryBot.create :user, user_type: 'delivery'
     @collection = FactoryBot.create :collection, shop: @shop
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

    it "should has many fulfilled orders" do
      2.times do
        FactoryBot.create :shop_order, user: @shop, pricing: @pricing, fulfiller: @user1
      end
      expect(@user1.fulfilled_orders.count).to eq(2)
    end


    it "should has many user roles" do
      @user1.add_role :admin
      expect(@user1.roles.count).to eq(2)
    end

    it "has and belongs to many delivery orders" do
      order = FactoryBot.create :order
      2.times do
        FactoryBot.create :order_delivery_map, order: order, delivery: @delivery
      end
      expect(@delivery.delivery_orders.count).to eq(2)
    end

    it "has and belongs to many deliveries & shops" do
      2.times do
        FactoryBot.create :shop_delivery_map, shop: @shop, delivery: @delivery
      end
      expect(@shop.deliveries.count).to eq(2)
      expect(@delivery.delivery_shops.count).to eq(2)
    end

    it "has many collections" do
      @shop = FactoryBot.create :user, user_type: 'shop'
      2.times do
        FactoryBot.create :collection, shop: @shop
      end
      expect(@shop.collections.count).to eq(2)
    end

    it "has many subscribers" do
      shop = FactoryBot.create :user, user_type: shop, subscriber_ids: subscriber_ids
      expect(shop.subscribers.count).to eq(2)
    end
  end
end
