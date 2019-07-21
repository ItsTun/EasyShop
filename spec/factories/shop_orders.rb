FactoryBot.define do
  factory :shop_order do
    quantity { 1 }
    status { 'pending' }
    payment_method { 'cash_collection' }
    orderable_type { 'Product' }
    association :user, factory: :user
    association :pricing, factory: :pricing
    association :fulfiller, factory: :user
  end
end
