class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :original_price, presence: true
  validates :quantity, presence: true
  validates :collection_id, presence: true

  belongs_to :collection, class_name: "Collection", foreign_key: :collection_id
  belongs_to :shop, class_name: "User", foreign_key: :shop_owner_id
  has_many :discount_products
  has_many :images
  has_one :order_line_item

end
