class Collection < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  belongs_to :shop, class_name: "User", foreign_key: :shop_id
  has_many :products
end
