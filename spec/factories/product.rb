FactoryBot.define do
  factory :product, :class => 'Product' do
    title { "MacBookPro" }
    price { 1200 }
    original_price { 1000 }
    quantity { 3 }
    association :collection, factory: :collection
    association :shop, factory: :user
  end
end