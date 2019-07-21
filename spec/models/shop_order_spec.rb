require 'rails_helper'

RSpec.describe ShopOrder, type: :model do
  it "has a valid factory" do
    shop = FactoryBot.create :user, user_type: 'shop'
    pricing = FactoryBot.create :pricing
    fulfiller = FactoryBot.create :user, user_type: 'user'
    shop_order = FactoryBot.create :shop_order, user: shop, pricing: pricing, fulfiller: fulfiller
    expect(shop_order).to be_persisted
  end

  before(:example) do
    @shop = FactoryBot.create :user, user_type: 'shop'
    @pricing = FactoryBot.create :pricing
    @fulfiller = FactoryBot.create :user, user_type: 'admin'
    @shop_order = FactoryBot.create :shop_order, user: @shop, pricing: @pricing, fulfiller: @fulfiller
    end

  context "validations" do
  end

  describe "relationship associations" do
    it "belongs to user" do
      expect(@shop_order.user).to eq(@shop)
    end

    it "belongs to pricing" do
      expect(@shop_order.pricing).to eq(@pricing)
    end
  end

  describe "shop order methods" do
    it "calculate amount" do
      expect(@shop_order.calculate_amount).to eq(15000)
    end

    it "check is fulfilled?" do
      expect(@shop_order.is_fulfilled?).to eq(false)
    end

    it "check is pending?" do
      expect(@shop_order.is_pending?).to eq(true)
    end

    it "check is cancel?" do
      expect(@shop_order.is_cancel?).to eq(false)
    end

    it "calculate duration" do
      expect(@shop_order.duration).to eq('1 month')
    end

    it "should return hash" do
      expect(@shop_order.build_fulfill_hash).to be_kind_of(Hash)
    end

    it "should retun fulfilled_at key in hash" do
      time = Time.now
      expect(@shop_order.build_fulfill_hash[:fulfilled_at]).not_to be_nil
      expect(@shop_order.build_fulfill_hash[:fulfilled_at]).to be >= time
    end

    it "should return fulfiller key in hash" do
      expect(@shop_order.build_fulfill_hash(user)[:fulfilled_by]).to eq(@shop.id)
    end

    it "should return start_at key in hash" do
      time = Time.now
      expect(@shop_order.build_fulfill_hash[:start_at]).not_to be_nil
      expect(@shop_order.build_fulfill_hash[:start_at]).to be >= time
    end

    it "should return expired_at key in hash" do
      time = Time.now + @shop_order.duration
      expect(@shop_order.build_fulfill_hash[:expired_at]).not_to be_nil
      expect(@shop_order.build_fulfill_hash[:expired_at]).to be >= time
    end

    it "hash of start_at should be fulfilled " do
      expect(@shop_order.build_fulfill_hash[:status]).not_to be_nil
      expect(@shop_order.build_fulfill_hash[:status]).to eq("fulfilled")
    end

    context "when there is other active order" do
      it "should return start_at key in hash" do
        time = @shop_order.active_order.expired_at
        expect(@shop_order.build_fulfill_hash[:start_at]).not_to be_nil
        expect(@shop_order.build_fulfill_hash[:start_at]).to be_within(5.second).of(time)
      end
      it "should return expired_at key in hash" do
        time = @shop_order.active_order.expired_at + @shop_order.duration
        expect(@shop_order.build_fulfill_hash[:expired_at]).not_to be_nil
        expect(@shop_order.build_fulfill_hash[:expired_at]).to be_within(5.second).of(time)
      end
    end

    it "fulfil shop order" do
    end
  end
end
