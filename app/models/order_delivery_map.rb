class OrderDeliveryMap < ApplicationRecord
  self.table_name = "deliveries_orders"
  belongs_to :order, class_name: "Order", foreign_key: :order_id
  belongs_to :delivery, class_name: "User", foreign_key: :delivery_id
end
