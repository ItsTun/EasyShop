class RenameOrderDeliveriesToDeliveriesOrders < ActiveRecord::Migration[5.2]
  def change
    rename_table :order_deliveries, :deliveries_orders
  end
end
