class DiscountProductMap < ApplicationRecord
  self.table_name = "discount_products"
  belongs_to :product, class_name: "Product", foreign_key: :product_id
  belongs_to :discount, class_name: "Discount", foreign_key: :discount_id
end
