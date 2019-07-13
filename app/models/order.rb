class Order < ApplicationRecord
  validates :order_type,presence: true
  validates :amount,presence: true

  belongs_to :user, class_name: "User"
  belongs_to :shop, class_name: "User"
  has_and_belongs_to_many :deliveries, class_name: 'User', association_foreign_key: "delivery_id", foreign_key: "order_id", :join_table => :deliveries_orders
  has_many :order_line_items


end
