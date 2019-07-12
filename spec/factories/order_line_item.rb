FactoryBot.define do
  factory :order_line_item, :class => 'OrderLineItem' do
    quantity { 3 }
    amount { 10000 }
    association :order, factory: :order
    association :product, factory: :product
  end
end