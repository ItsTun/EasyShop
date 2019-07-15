class Order < ApplicationRecord
  validates :order_type,presence: true
  validates :amount,presence: true

  belongs_to :user, class_name: "User"
  belongs_to :shop, class_name: "User"
  has_and_belongs_to_many :order_line_items, class_name: 'Product', association_foreign_key: "product_id", foreign_key: "order_id", :join_table => :order_line_items
  has_one :order_delivery_map, class_name: "OrderDeliveryMap", foreign_key: :order_id, dependent: :destroy
  has_one :delivery, class_name: "User", through: :order_delivery_map
end
