require 'rails_helper'

RSpec.describe Api::V1::User::ProductsController, type: :controller do
   before(:example) do
    @shop = FactoryBot.create :user, user_type: 'shop'
    @collection = FactoryBot.create :collection, shop: @shop
    @product = FactoryBot.attributes_for :product, shop: @shop, collection: @collection
  end
  describe "#show" do
    it "should show product detail of shop" do
      product = FactoryBot.create :product, shop: @shop, collection: @collection
      get :show, params: {shop_id: @shop.id, id: product.id, format: :json }
      expect(assigns(:product)).to eq(product)
    end

    it "should increase impression count fo product" do
      product = FactoryBot.create :product, shop: @shop, collection: @collection
      get :show, params: {shop_id: @shop.id, id: product.id, format: :json }
      expect(assigns(:product).impressionist_count).to eq(1)
    end
  end
end
