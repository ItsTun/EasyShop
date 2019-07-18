require 'rails_helper'

RSpec.describe Api::V1::User::ProductsController, type: :controller do
   before(:example) do
    @shop = FactoryBot.create :user, user_type: 'shop'
    @collection = FactoryBot.create :collection
    @product = FactoryBot.attributes_for :product
  end
  describe "#show" do
    it "should show product detail of shop" do
      product = FactoryBot.create :product
      get :show, params: {shop_id: @shop.id, id: product.id, format: :json }
      expect(assigns(:product)).to eq(product)
    end
  end
end
