class Api::V1::Shop::DiscountSerializer
  include FastJsonapi::ObjectSerializer
  attribute :shop do |object|
    "#{object.shop.name}"
  end
  attribute :discount_code, :discount_type, :discount_value,
            :min_requirements, :discount_start_date, :discount_end_date
end
