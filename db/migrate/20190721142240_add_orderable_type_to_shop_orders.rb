class AddOrderableTypeToShopOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :shop_orders, :orderable_type, :string
  end
end
