class Api::V1::Shop::ImageSerializer
  include FastJsonapi::ObjectSerializer
  attribute :product_image_url do |object|
    Rails.application.routes.url_helpers.url_for(object)
  end
end
