FactoryBot.define do

  sequence :title do |n|
    "Title#{n}"
  end

  sequence :description do |n|
    "Description#{n}"
  end

  factory :collection, :class => 'Collection' do
    title { generate(:title) }
    description { generate(:description) }
    association :shop, factory: :user
    association :category, factory: :category
  end
end