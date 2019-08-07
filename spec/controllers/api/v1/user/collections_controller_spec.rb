require 'rails_helper'

RSpec.describe Api::V1::User::CollectionsController, type: :controller do
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
end
