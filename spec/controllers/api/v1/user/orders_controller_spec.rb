require 'rails_helper'

RSpec.describe Api::V1::User::OrdersController, type: :controller do
  before(:example) do
    @shop = FactoryBot.create :user, user_type: 'shop'
    @collection = FactoryBot.create :collection, shop: @shop
    @user = FactoryBot.create :user, user_type: 'customer'
    sign_in @user
  end

  let(:product_ids) {
   product_ids = []
   product_ids << (FactoryBot.create :product, shop: @shop, collection: @collection).id
   product_ids << (FactoryBot.create :product, shop: @shop, collection: @collection).id
  }
  let(:order_attributes) {
   order = FactoryBot.create :order, user: @user, shop: @shop
   order.attributes.merge(product_ids: product_ids)
  }

  describe "#index" do
    it "should show orders of user" do
      2.times do
        FactoryBot.create :order, shop: @shop, user: @user
      end
      get :index, params: {shop_id: @shop.id, format: :json }
      expect(assigns(:orders).count).to eq(2)
    end

    it "should respond error for unauthenticated request" do
      sign_out @user
      get :index, params: {shop_id: @shop.id, format: :json }
      expect(response.status).to eq(401)
    end
  end

  describe "create" do
    it "should create order" do
      expect {
          post :create, params: {order: order_attributes, shop_id: @shop.id, format: :json }
        }.to change(Order, :count).by(2)
      expect(Order.last.products.count).to eq(2)
    end

    it "should respond error for unauthenticated request" do
      sign_out @user
      post :create, params: {order: order_attributes, shop_id: @shop.id, format: :json }
      expect(response.status).to eq(401)
    end
  end
end
