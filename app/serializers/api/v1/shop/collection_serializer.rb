class Api::V1::Shop::CollectionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description
end
