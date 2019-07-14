class Api::V1::Shop::OrderSerializer
  include FastJsonapi::ObjectSerializer
  attribute :user do |object|
    "#{object.user.name}"
  end
  attribute :shop do |object|
    "#{object.user.name}"
  end
  attributes :order_type, :amount, :created_at, :updated_at
  has_many :order_line_items
end
