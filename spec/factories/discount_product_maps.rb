FactoryBot.define do
  factory :discount_product_map do
    association :discount, factory: :discount
    association :product, factory: :product
  end
end
