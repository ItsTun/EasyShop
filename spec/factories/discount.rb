FactoryBot.define do
  factory :discount, :class => 'Discount' do
    discount_code { 'abcd' }
    discount_type { 'Auto' }
    discount_value { 3000 }
    min_requirements { 3 }
    discount_start_date { Time.now }
    discount_end_date { Time.now + 3.day }
    association :shop, factory: :user
  end
end