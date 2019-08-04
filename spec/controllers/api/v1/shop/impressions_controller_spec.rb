require 'rails_helper'

RSpec.describe Api::V1::Shop::ImpressionsController, type: :controller do
  describe "#home" do
    it "should show product detail of shop" do
      product = FactoryBot.create :product, shop: @shop, collection: @collection
      get :show, params: {shop_id: @shop.id, id: product.id, format: :json }
      expect(assigns(:product)).to eq(product)
    end
  end

  describe "#detail" do
    it "should show product detail of shop" do
      product = FactoryBot.create :product, shop: @shop, collection: @collection
      get :show, params: {shop_id: @shop.id, id: product.id, format: :json }
      expect(assigns(:product)).to eq(product)
    end
  end

  describe "#product" do
    it "should show product detail of shop" do
      product = FactoryBot.create :product, shop: @shop, collection: @collection
      get :show, params: {shop_id: @shop.id, id: product.id, format: :json }
      expect(assigns(:product)).to eq(product)
    end
  end

  describe "#show" do
    it "should show product detail of shop" do
      product = FactoryBot.create :product, shop: @shop, collection: @collection
      get :show, params: {shop_id: @shop.id, id: product.id, format: :json }
      expect(assigns(:product)).to eq(product)
    end
  end
end
