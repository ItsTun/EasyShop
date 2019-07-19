require 'rails_helper'

RSpec.describe Api::V1::Shop::OrdersController, type: :controller do
  before(:example) do
    @shop = FactoryBot.create :user, user_type: 'shop'
    @collection = FactoryBot.create :collection, shop: @shop
    @user = FactoryBot.create :user, user_type: 'customer'
  end

  let(:product_ids) {
   product_ids = []
   product_ids << (FactoryBot.create :product, collection: @collection, shop: @shop).id
   product_ids << (FactoryBot.create :product, collection: @collection, shop: @shop).id
  }
  let(:order_attributes) {
   order = FactoryBot.create :order, user: @user, shop: @shop
   order.attributes.merge(product_ids: product_ids)
  }

  let(:delivery_order_ids) {
   ids = []
   ids << (FactoryBot.create :order).id
   ids << (FactoryBot.create :order).id
  }


  describe "index" do
    it "should return all orders of shop" do
      3.times do
        FactoryBot.create :order, user: @user, shop: @shop
      end
      get :index, params: {shop_id: @shop.id, format: :json }
      expect(assigns(:orders).count).to eq(3)
    end
  end

  describe "create" do
    it "should create order" do
      expect {
          post :create, params: {order: order_attributes, shop_id: @shop.id, format: :json }
        }.to change(Order, :count).by(2)
      expect(Order.last.products.count).to eq(2)
    end
  end

  describe "update" do
    it "shoud update existed order" do
      order = FactoryBot.create :order, user: @user, shop: @shop
      put :update, params: {order: order_attributes,shop_id: @shop.id, id: order.id, format: :json }
      expect(assigns(:order).products.count).to eq(2)
    end
  end

  describe "deliveries" do
    it "should show all deliveries" do
      2.times do
        FactoryBot.create :user, user_type: 'delivery'
      end
      get :delivery, params: {shop_id: @shop.id, format: :json }
      expect(assigns(:deliveries).count).to eq(2)
    end
  end

  describe "choose_delivery" do
    it "should update orders for delivery" do
      delivery = FactoryBot.create :user, user_type: 'delivery'
      put :choose_delivery, params: {delivery: delivery.attributes.merge(delivery_order_ids: delivery_order_ids), shop_id: @shop.id, id: delivery.id}
      expect(assigns(:delivery).delivery_orders.count).to eq(2)
    end
  end

  describe "delete" do
    it "should delete order" do
      order = FactoryBot.create :order, user: @user, shop: @shop
      expect {
        delete :destroy, params: {shop_id: @shop.id, id: order.id}
      }.to change(Order, :count).by(-1)
    end
  end
end
