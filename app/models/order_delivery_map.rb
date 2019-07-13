class OrderDeliveryMap < ApplicationRecord
  self.table_name = "order_deliveries"
  belongs_to :order, class_name: "Order", foreign_key: :order_id, autosave: true
  belongs_to :delivery, class_name: "User", foreign_key: :delivery_id, autosave: true
  validates :order_id, presence: true
  validates :delivery_id, presence: true
end
