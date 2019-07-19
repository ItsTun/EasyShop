class Collection < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  has_many :products
  belongs_to :shop, class_name: "User", foreign_key: :shop_id
end
