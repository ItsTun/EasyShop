class Discount < ApplicationRecord
  validates :discount_code, presence: true
  validates :discount_type, presence: true
  validates :discount_value, presence: true
  validates :min_requirements, presence: true
  validates :discount_start_date, presence: true
  validates :discount_end_date, presence: true

  belongs_to :shop, class_name: "User", foreign_key: :shop_owner_id
  has_many :discount_products
end
