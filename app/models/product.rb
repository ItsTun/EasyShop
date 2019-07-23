class Product < ApplicationRecord
  include ProductSearchable
  validates :title, presence: true
  validates :price, presence: true
  validates :original_price, presence: true
  validates :quantity, presence: true
  validates :collection_id, presence: true

  belongs_to :collection, class_name: "Collection", foreign_key: :collection_id
  belongs_to :category, class_name: "Category", foreign_key: :category_id
  belongs_to :shop, class_name: "User", foreign_key: :shop_id
  has_and_belongs_to_many :discounts, class_name: 'Discount', association_foreign_key: "discount_id", foreign_key: "product_id", :join_table => :discount_products
  has_and_belongs_to_many :orders, class_name: 'Order', association_foreign_key: "order_id", foreign_key: "product_id", :join_table => :order_line_items
  has_many_attached :images
  has_one :order_line_item
end
