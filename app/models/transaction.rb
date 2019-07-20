class Transaction < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  belongs_to :pricing, class_name: 'Pricing', foreign_key: :pricing_id
end
