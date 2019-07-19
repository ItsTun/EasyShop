class AddShopIdToCollections < ActiveRecord::Migration[5.2]
  def change
    add_column :collections, :shop_id, :int
  end
end
