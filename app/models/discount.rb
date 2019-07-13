class Discount < ApplicationRecord
  validates :discount_code, presence: true
  validates :discount_type, presence: true
  validates :discount_value, presence: true
  validates :min_requirements, presence: true
  validates :discount_start_date, presence: true
  validates :discount_end_date, presence: true

  belongs_to :shop, class_name: "User", foreign_key: :shop_id
  has_and_belongs_to_many :products, class_name: 'Product', association_foreign_key: "product_id", foreign_key: "discount_id", :join_table => :discount_products
end
