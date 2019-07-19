require 'rails_helper'

RSpec.describe Api::V1::User::SubscriptionsController, type: :controller do
  before(:example) do
    @shop = FactoryBot.create :user, user_type: 'shop'
  end

  let(:subscription_attributes) {
    FactoryBot.attributes_for :user
   }

   let(:user_ids) {
    user_ids = []
    user_ids << (FactoryBot.create :user, user_type: 'user').id
   }

  describe "#create" do
    it "should create shop subcription for shop" do
      post :create, params: {shop: subscription_attributes.merge(subscriber_ids: user_ids), shop_id: @shop.id, format: :json }
      expect(assigns(:shop).subscribers.count).to eq(1)
    end
  end
end
