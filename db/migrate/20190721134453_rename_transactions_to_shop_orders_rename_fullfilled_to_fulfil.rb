class RenameTransactionsToShopOrdersRenameFullfilledToFulfil < ActiveRecord::Migration[5.2]
  def change
    rename_table :transactions, :shop_orders
    rename_column :shop_orders, :fullfilled_by, :fulfilled_by
    rename_column :shop_orders, :fullfilled_at, :fulfilled_at
    rename_column :shop_orders, :fullfilled_price, :fulfilled_price
  end
end
