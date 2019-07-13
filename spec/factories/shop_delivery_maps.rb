FactoryBot.define do
  factory :shop_delivery_map do
    association :shop, factory: :user
    association :delivery, factory: :user
  end
end
