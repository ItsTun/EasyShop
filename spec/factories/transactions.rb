FactoryBot.define do
  factory :transaction do
    quantity { 1 }
    status { 'pending' }
    payment_method { 'cash_collection' }
    association :user, factory: :user
    association :pricing, factory: :pricing
  end
end
