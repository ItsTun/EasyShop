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

  describe "create" do
    it "should create order" do
      byebug
      expect {
          post :create, params: {order: order_attributes, shop_id: @shop.id, format: :json }
        }.to change(Order, :count).by(2)
      expect(Order.last.products.count).to eq(2)
    end
  end
end
