require 'rails_helper'

RSpec.describe CollectionPolicy, type: :policy do
  let(:user) { FactoryBot.create :user, user_type: 'shop' }
  let(:category) { FactoryBot.create :category }
  let(:collection) { FactoryBot.create :collection, shop: user, category: category }

  subject { CollectionPolicy }

  permissions :index?, :new?, :create?, :show?, :update?, :destroy? do
    it "allows shop owner" do
      expect(subject).to permit(user, collection)
    end

    it "allows admin" do
      user = FactoryBot.create :user, user_type: 'admin'
      expect(subject).to permit(user, collection)
    end

    it "doesn't allow other users" do
      user = FactoryBot.create :user, id: 3
      expect(subject).not_to permit(user, collection)
    end
  end
end
