class DiscountProductMap < ApplicationRecord
  self.table_name = "discount_products"

  belongs_to :product, class_name: "Product", foreign_key: :product_id, autosave: true
  belongs_to :discount, class_name: "Discount", foreign_key: :discount_id, autosave: true
  validates :product_id, presence: true
  validates :discount_id, presence: true
end
