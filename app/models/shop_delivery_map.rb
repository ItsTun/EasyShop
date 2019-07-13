class ShopDeliveryMap < ApplicationRecord
  self.table_name = "shop_deliveries"
  belongs_to :shop, class_name: "User", foreign_key: :shop_id
  belongs_to :delivery, class_name: "User", foreign_key: :delivery_id
end
