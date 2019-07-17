require 'rails_helper'

RSpec.describe Api::V1::Shop::DiscountsController, type: :controller do
  before(:example) do
    @shop = FactoryBot.create :user, user_type: 'shop'
    @collection = FactoryBot.create :collection
  end

  let(:discount_attributes) {
    shop = FactoryBot.attributes_for :discount
   }

   let(:product_ids) {
    product_ids = []
    product_ids << (FactoryBot.create :product, shop: @shop, collection: @collection).id
    product_ids << (FactoryBot.create :product, shop: @shop, collection: @collection).id
   }

  describe "#index" do
    it 'should show all discounts of shop' do
      3.times do
        FactoryBot.create :discount, shop: @shop
      end
      get :index, params: {shop_id: @shop.id, format: :json }
      expect(assigns(:discounts).count).to eq(3)
    end
  end

  describe "#create" do
    it "should create discount of shop and has many products" do
      expect {
          post :create, params: {discount: discount_attributes.merge(shop_id: @shop.id,product_ids: product_ids), shop_id: @shop.id, format: :json }
        }.to change(Discount, :count).by(1)
      expect(assigns(:discount).products.count).to eq(2)
    end
  end

  describe "#update" do
    it "shoud update existed discount" do
      post :create, params: {discount: discount_attributes.merge(shop_id: @shop.id,product_ids: product_ids), shop_id: @shop.id, format: :json }
      put :update, params: {discount: Discount.last.attributes.merge(shop_id: @shop.id,product_ids: [Discount.last.products.first.id]),shop_id: @shop.id, id: Discount.last.id, format: :json }
      expect(Discount.last.products.count).to eq(1)
    end
  end

  describe "#show" do
    it "should show product detail of shop" do
      discount = FactoryBot.create :discount, shop: @shop
      get :show, params: {shop_id: @shop.id, id: discount.id, format: :json }
      expect(assigns(:discount)).to eq(discount)
    end
  end

  describe "#destroy" do
    it "destroys the requested discount" do
      discount = FactoryBot.create :discount, shop: @shop
      expect {
        delete :destroy, params: {shop_id: @shop.id, id: discount.id}
      }.to change(Discount, :count).by(-1)
    end
  end
end
