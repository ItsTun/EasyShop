FactoryBot.define do
  factory :pricing, class: Pricing do
    id { Figaro.env.PRO_ID }
    name { "Pro Ad" }
    price { 15000 }
    unit { "month" }
    description { "Shopie's Pro Ad" }
  end

  factory :premium_ad, class: Pricing do
    id { Figaro.env.PREMIUM_AD }
    name { "Premium Ad" }
    price { 30000 }
    unit { "month" }
    description { "Shopie's Premium Ad" }
  end
end
