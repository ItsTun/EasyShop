require 'rails_helper'

RSpec.describe Shop::ImagePolicy, type: :policy do
  let(:shop) { FactoryBot.create :user, user_type: 'shop' }
  let(:category) { FactoryBot.create :category }
  let(:collection) { FactoryBot.create :collection }
  let(:product) { FactoryBot.create :product, collection: collection, shop: shop, category: category}

  subject { Shop::ImagePolicy }

  permissions :show?, :destroy? do
    it "allows shop owner" do
      product.images.attach(io: File.new(Rails.root.join('public', 'test.png')), filename: 'test.png')
      expect(subject).to permit(shop, product.images.first)
    end

    it "allows admin" do
      product.images.attach(io: File.new(Rails.root.join('public', 'test.png')), filename: 'test.png')
      user = FactoryBot.create :user, user_type: 'admin'
      expect(subject).to permit(user, product.images.first)
    end

    it "doesn't allow other users" do
      product.images.attach(io: File.new(Rails.root.join('public', 'test.png')), filename: 'test.png')
      user = FactoryBot.create :user, id: 3
      expect(subject).not_to permit(user, product.images.first)
    end
  end
end
