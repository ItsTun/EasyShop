FactoryBot.define do
  factory :shop_collection_map do
    association :shop, factory: :user
    association :collection, factory: :collection
  end
end
