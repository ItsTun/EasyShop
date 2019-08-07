class Order < ApplicationRecord
  validates :order_type,presence: true
  validates :amount,presence: true

  belongs_to :user, class_name: "User"
  belongs_to :shop, class_name: "User"
  belongs_to :fulfiller,
              class_name: "User",
              foreign_key: :fulfilled_by,
              optional: true
  has_and_belongs_to_many :products, class_name: 'Product', association_foreign_key: "product_id", foreign_key: "order_id", :join_table => :order_line_items
  has_one :order_delivery_map, class_name: "OrderDeliveryMap", foreign_key: :order_id, dependent: :destroy
  has_one :delivery, class_name: "User", through: :order_delivery_map

  PAYMENT_CASH_COLLECTION = "cash_collection"
  PAYMENT_BANK_TRANSFER = "bank_transfer"
  PAYMENT_CREDIT = "credit"

  PAYMENT_METHODS = [PAYMENT_CASH_COLLECTION, PAYMENT_BANK_TRANSFER, PAYMENT_CREDIT]

  scope :cancelled, -> { where(status: "cancelled") }
  scope :fulfilled, -> { where(status: "fulfilled") }
  scope :pending, -> { where(status: "pending") }
end
