class Api::V1::UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :contact_number, :description, :user_name, :user_type, :created_at, :updated_at
end
