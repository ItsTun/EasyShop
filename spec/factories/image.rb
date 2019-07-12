FactoryBot.define do

  factory :image do
    association :product, factory: :product
  end
end