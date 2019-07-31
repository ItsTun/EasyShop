require 'rails_helper'

RSpec.describe ProductPolicy, type: :policy do
  let(:shop) { FactoryBot.create :user, user_type: 'shop' }
  let(:collection) { FactoryBot.create :collection }
  let(:category) { FactoryBot.create :category }
  let(:product) { FactoryBot.create :product, shop: shop, collection: collection, category: category}

  subject { ProductPolicy }

  permissions :index?, :new?, :create?, :show?, :update?, :destroy? do
    it "allows shop owner" do
      expect(subject).to permit(shop, product)
    end

    it "allows admin" do
      user = FactoryBot.create :user, user_type: 'admin'
      expect(subject).to permit(user, product)
    end

    it "doesn't allow other users" do
      user = FactoryBot.create :user, id: 3
      expect(subject).not_to permit(user, product)
    end
  end
end
