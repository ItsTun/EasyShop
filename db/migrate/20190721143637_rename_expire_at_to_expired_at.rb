class RenameExpireAtToExpiredAt < ActiveRecord::Migration[5.2]
  def change
    rename_column :shop_orders, :expire_at, :expired_at
  end
end
