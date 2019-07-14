class Api::V1::Shop::ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :price, :original_price, :quantity, :created_at, :updated_at
end
