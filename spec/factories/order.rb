FactoryBot.define do
  factory :order, :class => 'Order' do
    order_type { 'ShopOrder' }
    amount { 5000 }
    association :user, factory: :user
    association :shop, factory: :user
  end
end