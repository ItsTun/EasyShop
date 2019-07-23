FactoryBot.define do
  sequence :category do |n|
    "Category#{n}"
  end

  factory :category, :class => 'Category' do
    title { generate(:category) }
  end
end
