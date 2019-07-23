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

  describe "#cancel" do
    subject {FactoryBot.create :shop_order}
    it "will change status to cancelled" do
      expect{subject.cancel}.to change{subject.status}.from("pending").to("cancelled")
    end
  end

  describe "#build_fulfill_hash" do

    let(:pricing) { FactoryBot.create :pricing }
    let(:user) { FactoryBot.create :user, user_type: 'user'}
    let(:fulfiller) { FactoryBot.create :user, user_type: 'admin'}
    let(:active_order) do
      FactoryBot.create(:shop_order,
        status: "fulfilled",
        start_at: 1.days.ago,
        expired_at: 1.days.from_now,
        pricing: pricing,
        user: user,
        fulfiller: fulfiller
        )
    end
    let(:pending_order) do
      FactoryBot.create(:shop_order,
        pricing: pricing,
        user: user)
    end

    it "should return hash" do
      expect(pending_order.build_fulfill_hash).to be_kind_of(Hash)
    end

    it "should retun fulfilled_at key in hash" do
      time = Time.now
      expect(pending_order.build_fulfill_hash[:fulfilled_at]).not_to be_nil
      expect(pending_order.build_fulfill_hash[:fulfilled_at]).to be >= time
    end

    it "should return start_at key in hash" do
      time = Time.now
      expect(pending_order.build_fulfill_hash[:start_at]).not_to be_nil
      expect(pending_order.build_fulfill_hash[:start_at]).to be >= time
    end

    it "should return expired_at key in hash" do
      time = Time.now + pending_order.duration
      expect(pending_order.build_fulfill_hash[:expired_at]).not_to be_nil
      expect(pending_order.build_fulfill_hash[:expired_at]).to be >= time
    end

    it "hash of start_at should be fulfilled " do
      expect(pending_order.build_fulfill_hash[:status]).not_to be_nil
      expect(pending_order.build_fulfill_hash[:status]).to eq("fulfilled")
    end

    context "when there is other active order" do
      it "should return start_at key in hash" do
        time = active_order.expired_at
        expect(pending_order.build_fulfill_hash[:start_at]).not_to be_nil
        expect(pending_order.build_fulfill_hash[:start_at]).to be_within(5.second).of(time)
      end
      it "should return expired_at key in hash" do
        time = active_order.expired_at + pending_order.duration
        expect(pending_order.build_fulfill_hash[:expired_at]).not_to be_nil
        expect(pending_order.build_fulfill_hash[:expired_at]).to be_within(5.second).of(time)
      end
    end
  end

  describe "#fulfill" do
    subject { FactoryBot.create :shop_order, pricing: @pricing, user: @shop }
    it "will change status to fulfilled" do
      expect{subject.fulfill(fulfilled_by: @fulfiller)}.to change{subject.status}.from("pending").to("fulfilled")
    end

    it 'will store fulfilled_price to the order' do
      expect{subject.fulfill}.to change{subject.fulfilled_price}.to(subject.pricing.price * subject.quantity)
    end

    it 'will store fulfilled_price with actual fulfilled price to the order' do
      actual_fulfilled_price = 1000
      expect{subject.fulfill(fulfilled_price: actual_fulfilled_price)}.to change{ subject.fulfilled_price }
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
      expect(@shop_order.duration).to eq(1.month)
    end

    it "fulfil shop order" do
    end
  end
end
