class AddStatusFullfilledByToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :status, :string
    add_column :orders, :fulfilled_by, :int
  end
end
