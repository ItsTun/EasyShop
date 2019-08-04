require 'rails_helper'

RSpec.describe Api::V1::User::HomeController, type: :controller do
  before(:example) do
    @shop = FactoryBot.create :user, user_type: 'shop'
    @collection = FactoryBot.create :collection, shop: @shop
    2.times do
      product = FactoryBot.create :product, shop: @shop, collection: @collection
    end
  end

  describe "#index" do
    it "should show products of shop" do
      get :index, params: {shop_id: @shop.id, format: :json }
      expect(assigns(:products).count).to eq(2)

    end

    it "should increase impression count fo product" do
      product = FactoryBot.create :product, shop: @shop, collection: @collection
      expect {
        get :index, params: {shop_id: @shop.id, format: :json }
      }.to change(Impression, :count).by(1)
    end
  end
end
