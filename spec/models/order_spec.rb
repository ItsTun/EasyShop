require 'rails_helper'

RSpec.describe Collection, type: :model do
  it "has a valid factory" do
    order = FactoryBot.create :order
    expect(order).to be_persisted
  end

  context "validations" do
  end

  describe "relationship associations" do
    before(:example) do
     @user = FactoryBot.create :user, user_type: 'customer'
     @shop = FactoryBot.create :user, user_type: 'shop'
     @collection = FactoryBot.create :collection
    end

    it "should belongs to user" do
      order = FactoryBot.create :order, user: @user, shop: @shop
      expect(order.user).to eq(@user)
    end

    it "should belongs to shop" do
      order = FactoryBot.create :order, user: @user, shop: @shop
      expect(order.shop).to eq(@shop)
    end

    it "has many order line items" do
      order = FactoryBot.create :order, user: @user, shop: @shop
      product = FactoryBot.create :product, collection: @collection, shop: @shop
      2.times do
        FactoryBot.create :order_line_item,
                           order: order,
                           product: product
      end
      expect(order.order_line_items.count).to eq(2)
    end

    it "should should has many deliveries" do
      order = FactoryBot.create :order
      delivery = FactoryBot.create :user, user_type: 'delivery'
      2.times do
        FactoryBot.create :order_delivery_map, order: order, delivery: delivery
      end
      expect(order.deliveries.count).to eq(2)
    end
  end
end
