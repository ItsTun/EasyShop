require 'rails_helper'

RSpec.describe Collection, type: :model do
  it "has a valid factory" do
    order = FactoryBot.create :order
    expect(order).to be_persisted
  end

  let(:product_ids) {
   product_ids = []
   product_ids << (FactoryBot.create :product).id
   product_ids << (FactoryBot.create :product).id
  }

  context "validations" do
  end

  describe "relationship associations" do
    before(:example) do
     @user = FactoryBot.create :user, user_type: 'customer'
     @shop = FactoryBot.create :user, user_type: 'shop'
     @collection = FactoryBot.create :collection, shop: @shop
    end

    it "should belongs to user" do
      order = FactoryBot.create :order, user: @user, shop: @shop
      expect(order.user).to eq(@user)
    end

    it "should belongs to shop" do
      order = FactoryBot.create :order, user: @user, shop: @shop
      expect(order.shop).to eq(@shop)
    end

    it "has one delivery" do
      order = FactoryBot.create :order
      delivery = FactoryBot.create :user, user_type: 'delivery'
      FactoryBot.create :order_delivery_map, order: order, delivery: delivery
      expect(order.delivery).to eq(delivery)
    end
  end
end
