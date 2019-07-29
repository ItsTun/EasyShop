require 'rails_helper'

RSpec.describe Api::V1::Shop::ImagesController, type: :controller do
  before(:example) do
    @shop = FactoryBot.create :user, user_type: 'shop'
    sign_in @shop
    @collecion = FactoryBot.create :collection, shop: @shop
    @product = FactoryBot.create :product, shop: @shop, collection: @collecion
    @product.images.attach(io: File.new(Rails.root.join('public', 'test.png')), filename: 'test.png')
  end

  describe "show" do
    it "should show image of product" do
      get :show, params: {shop_id: @shop.id, product_id: @product.id, image_id: @product.images.first.id,  format: :json }
      expect(assigns(:image).id).to eq(@product.images.first.id)
    end

    it "should respond error for unauthenticated request" do
      sign_out @shop
       get :show, params: {shop_id: @shop.id, product_id: @product.id, image_id: @product.images.first.id,  format: :json }
      expect(response.status).to eq(401)
    end
  end

  describe "destroy" do
    it "should delete image" do
      expect {
        delete :destroy, params: {shop_id: @shop.id, product_id: @product.id, image_id: @product.images.first.id, format: :json}
      }.to change(ActiveStorage::Blob, :count).by(-1)
    end

     it "should respond error for unauthenticated request" do
      sign_out @shop
      delete :destroy, params: {shop_id: @shop.id, product_id: @product.id, image_id: @product.images.first.id, format: :json}
      expect(response.status).to eq(401)
    end
  end

end
