class Collection < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  has_many :products
  has_and_belongs_to_many :shops, class_name: 'User', association_foreign_key: "shop_id", foreign_key: "collection_id", :join_table => :shop_collections
end
