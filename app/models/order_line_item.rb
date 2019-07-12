class OrderLineItem < ApplicationRecord
  validates :quantity, presence: true
  validates :amount, presence: true

  belongs_to :order, class_name: "Order", foreign_key: :order_id
  belongs_to :product, class_name: "Product", foreign_key: :product_id
end
