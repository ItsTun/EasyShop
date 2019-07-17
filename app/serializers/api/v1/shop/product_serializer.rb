class Api::V1::Shop::ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :price, :original_price, :quantity, :created_at, :updated_at
  attribute :images do |object|
    object.images.as_json
  end
end
