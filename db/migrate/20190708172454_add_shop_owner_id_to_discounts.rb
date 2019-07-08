class AddShopOwnerIdToDiscounts < ActiveRecord::Migration[5.2]
  def change
    add_column :discounts, :shop_owner_id, :int
  end
end
