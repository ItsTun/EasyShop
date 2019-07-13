FactoryBot.define do
  factory :order_delivery_map do
    association :order, factory: :order
    association :delivery, factory: :user
  end
end
