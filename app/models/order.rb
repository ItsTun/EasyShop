class Order < ApplicationRecord
  validates :order_type,presence: true
  validates :amount,presence: true

  belongs_to :user, class_name: "User", foreign_key: :user_id
  belongs_to :shop, class_name: "User", foreign_key: :shop_owner_id
  has_and_belongs_to_many :deliveries, class_name: 'User', association_foreign_key: "delivery_id", foreign_key: "order_id"
  has_many :order_line_items


end
