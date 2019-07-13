class ShopDeliveryMap < ApplicationRecord
  self.table_name = "shop_deliveries"
  belongs_to :shop, class_name: "User", foreign_key: :shop_id, autosave: true
  belongs_to :delivery, class_name: "User", foreign_key: :delivery_id, autosave: true
  validates :shop_id, presence: true
  validates :delivery_id, presence: true
end
