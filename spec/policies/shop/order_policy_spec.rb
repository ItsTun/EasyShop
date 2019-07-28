require 'rails_helper'

RSpec.describe Shop::OrderPolicy, type: :policy do
  let(:shop) { FactoryBot.create :user, user_type: 'shop' }
  let(:user) { FactoryBot.create :user }
  let(:order) { FactoryBot.create :order, user: user, shop: shop}

  subject { Shop::OrderPolicy }

  permissions :index?, :new?, :create?, :show?, :update?, :destroy? do
    it "allows shop owner" do
      expect(subject).to permit(shop, order)
    end

    it "allows admin" do
      user = FactoryBot.create :user, user_type: 'admin'
      expect(subject).to permit(user, order)
    end

    it "doesn't allow other users" do
      user = FactoryBot.create :user, id: 3
      expect(subject).not_to permit(user, order)
    end
  end
end
