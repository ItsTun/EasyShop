class Collection < ApplicationRecord
  validates :title, presence: true
  validates :shop_id, presence: true
  validates :category_id, presence: true
  has_many :products
  belongs_to :shop, class_name: "User", foreign_key: :shop_id
  belongs_to :category, class_name: "Category", foreign_key: :category_id
end
