require 'rails_helper'

RSpec.describe Shop::DiscountPolicy, type: :policy do
  let(:user) { FactoryBot.create :user, user_type: 'shop' }
  let(:discount) { FactoryBot.create :discount, shop: user }

  subject { Shop::DiscountPolicy }

  permissions :index?, :new?, :create?, :show?, :update?, :destroy? do
    it "allows shop owner" do
      expect(subject).to permit(user, discount)
    end

    it "allows admin" do
      user = FactoryBot.create :user, user_type: 'admin'
      expect(subject).to permit(user, discount)
    end

    it "doesn't allow other users" do
      user = FactoryBot.create :user, id: 3
      expect(subject).not_to permit(user, discount)
    end
  end
end
