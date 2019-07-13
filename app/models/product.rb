class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :original_price, presence: true
  validates :quantity, presence: true
  validates :collection_id, presence: true

  belongs_to :collection, class_name: "Collection", foreign_key: :collection_id
  belongs_to :shop, class_name: "User", foreign_key: :shop_id
  has_and_belongs_to_many :discounts, class_name: 'Discount', association_foreign_key: "discount_id", foreign_key: "product_id", :join_table => :discount_products
  has_many :images
  has_one :order_line_item

end
