class RemoveShopOwnerIdFromCollections < ActiveRecord::Migration[5.2]
  def change
    remove_column :collections, :shop_owner_id
  end
end
