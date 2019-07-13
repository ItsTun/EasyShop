require 'rails_helper'

RSpec.describe Collection, type: :model do
  it "has a valid factory" do
    order_line_item = FactoryBot.create :order_line_item
    expect(order_line_item).to be_persisted
  end

  context "validations" do
  end

  describe "relationship associations" do
    before(:example) do
     @order = FactoryBot.create :order
     @product = FactoryBot.create :product
    end

    it "belongs to order" do
      order_line_item = FactoryBot.create :order_line_item, order: @order, product: @product
      expect(order_line_item.order).to eq(@order)
    end

    it "belongs to product" do
      order_line_item = FactoryBot.create :order_line_item, order: @order, product: @product
      expect(order_line_item.product).to eq(@product)
    end
  end
end
