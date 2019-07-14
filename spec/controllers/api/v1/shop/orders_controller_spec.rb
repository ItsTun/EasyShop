require 'rails_helper'

RSpec.describe Api::V1::Shop::OrdersController, type: :controller do
  before(:example) do
    @shop = FactoryBot.create :user, user_type: 'shop'
    @user = FactoryBot.create :user, user_type: 'customer'
  end
  describe "index" do
    it "should return all orders of shop" do
      3.times do
        FactoryBot.create :order, user: @user, shop: @shop
      end
      get :index, params: {shop_id: @shop.id, format: :json }
      expect(assigns(:orders).count).to eq(3)
    end
  end
end
