class AddShopOwnerIdToCollections < ActiveRecord::Migration[5.2]
  def change
    add_column :collections, :shop_owner_id, :int
  end
end
