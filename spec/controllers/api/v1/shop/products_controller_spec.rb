require 'rails_helper'

RSpec.describe Api::V1::Shop::ProductsController, type: :controller do
  before(:example) do
    @shop = FactoryBot.create :user, user_type: 'shop'
    @collection = FactoryBot.create :collection
    @product = FactoryBot.attributes_for :product
  end

  let(:product_attributes) {
    @product.merge(shop_id: @shop.id,collection_id: @collection.id)
   }

  describe "index" do
    it "should return all collections of shop" do
      3.times do
        FactoryBot.create :product, shop: @shop
      end
      get :index, params: {shop_id: @shop.id, format: :json }
      expect(assigns(:products).count).to eq(3)
    end
  end

  describe "create" do
    it "should create product of shop" do
      expect {
          post :create, params: {product: product_attributes, shop_id: @shop.id, format: :json }
        }.to change(Product, :count).by(1)
    end
  end

  describe "show" do
    it "should show product detail of shop" do
      product = FactoryBot.create :product
      get :show, params: {shop_id: @shop.id, id: product.id, format: :json }
      expect(assigns(:product)).to eq(product)
    end
  end

  describe "update" do
    it "shoud update existed product" do
      product = FactoryBot.create :product
      get :show, params: {shop_id: shop.id, format: :json }
      expect(Product.last.title).to eq("Update")
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested product" do
      product = FactoryBot.create :product
      expect {
        delete :destroy, params: {shop_id: @shop.id, id: product.id}
      }.to change(Product, :count).by(-1)
    end
  end
end
