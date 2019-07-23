require 'rails_helper'

RSpec.describe Api::V1::Shop::CollectionsController, type: :controller do
  before(:example) do
    @shop = FactoryBot.create :user, user_type: 'shop'
    @category = FactoryBot.create :category
  end

  let(:collection_attributes) {
    FactoryBot.attributes_for :collection
   }

  describe "index" do
    it "should return all collections" do
      3.times do
        FactoryBot.create :collection, shop: @shop, category: @category
      end
      get :index, params: {shop_id: @shop.id, format: :json }
      expect(assigns(:collections).count).to eq(3)
    end
  end

  describe "create" do
    it "should create shop_collection according to collection ids array" do
      expect {
          post :create, params: {collection: collection_attributes.merge(shop_id: @shop.id, category_id: @category.id), shop_id: @shop.id, format: :json }
        }.to change(Collection, :count).by(1)
    end
  end

  describe "#update" do
    it "shoud update existed collection" do
      collection = FactoryBot.create :collection
      put :update, params: {collection: collection_attributes.merge(title: 'OK',shop_id: @shop.id,category_id: @category.id),shop_id: @shop.id, id: collection.id, format: :json }
      expect(Collection.last.title).to eq('OK')
    end
  end

  describe "show" do
    it "should return only shop collections" do
      collection = FactoryBot.create :collection, shop: @shop, category: @category
      get :show, params: {shop_id: @shop.id, id: collection.id, format: :json }
      expect(assigns(:collection)).to eq(collection)
    end
  end

  describe "#destroy" do
    it "destroys the requested collection" do
      collection = FactoryBot.create :collection
      expect {
        delete :destroy, params: {shop_id: @shop.id, id: collection.id}
      }.to change(Collection, :count).by(-1)
    end
  end
end
