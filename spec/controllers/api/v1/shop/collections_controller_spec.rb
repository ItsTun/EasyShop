require 'rails_helper'

RSpec.describe Api::V1::Shop::CollectionsController, type: :controller do
  before(:example) do
    @shop = FactoryBot.create :user, user_type: 'shop'
    @collection1 = FactoryBot.create :collection, shop: @shop
    @collection2 = FactoryBot.create :collection, shop: @shop
  end

  let(:shop_collection_attributes) {
    collection_ids = []
    collection_ids << @collection1.id
    collection_ids << @collection2.id
   }

  describe "index" do
    it "should return all collections" do
    end
  end

  describe "create" do
    it "should create shop_collection according to collection ids array" do
    end
  end

  describe "show" do
    it "should return only shop collections" do
      shop = FactoryBot.create :user, user_type: 'shop', collection_ids: shop_collection_attributes
      get :show, params: {shop_id: shop.id, format: :json }
      expect(assigns(:shop).collections.count).to eq(2)
    end
  end
end
