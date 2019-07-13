class ShopCollectionMap < ApplicationRecord
  self.table_name = "shop_collections"
  belongs_to :shop, class_name: "User", foreign_key: :shop_id
  belongs_to :collection, class_name: "Collection", foreign_key: :collection_id
end
