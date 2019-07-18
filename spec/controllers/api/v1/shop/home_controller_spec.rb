require 'rails_helper'

RSpec.describe Api::V1::Shop::HomeController, type: :controller do
  before(:example) do
    @shop = FactoryBot.create :user, user_type: 'shop'
    @collection1 = FactoryBot.create :collection, shop: @shop
    @collection2 = FactoryBot.create :collection, shop: @shop
  end
  describe "#index" do
    it "should return all collections of shop" do
      get :index, params: { format: :json, shop_id: @shop.id}
      expect(assigns(:collections).count).to eq(2)
    end
  end
end
