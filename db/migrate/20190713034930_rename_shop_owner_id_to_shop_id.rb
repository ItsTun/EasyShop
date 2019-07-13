class RenameShopOwnerIdToShopId < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :shop_owner_id, :shop_id
    rename_column :products, :shop_owner_id, :shop_id
    rename_column :discounts, :shop_owner_id, :shop_id
  end
end
