require 'rails_helper'

RSpec.describe Api::V1::User::FavouritesController, type: :controller do
  before(:example) do
    @shop = FactoryBot.create :user, user_type: 'shop'
    @collection = FactoryBot.create :collection, shop: @shop
    @user = FactoryBot.create :user, user_type: 'customer'
    sign_in @user
  end

  let(:product_ids) {
   product_ids = []
   product_ids << (FactoryBot.create :product, shop: @shop, collection: @collection).id
   product_ids << (FactoryBot.create :product, shop: @shop, collection: @collection).id
  }

  describe "create" do
    it "should create favourite products" do
      post :create, params: {favourite: @user.attributes.merge(favourite_ids: product_ids), shop_id: @shop.id, format: :json }
      expect(@user.favourites.count).to eq(2)
    end

    it "should respond error for unauthenticated request" do
      sign_out @user
      post :create, params: {favourite: @user.attributes.merge(favourite_ids: product_ids), shop_id: @shop.id, format: :json }
      expect(response.status).to eq(401)
    end
  end
end

