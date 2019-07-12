FactoryBot.define do
  factory :discount_product_map do
    association :product, factory: :product
    association :discount, factory: :discount
  end
end
