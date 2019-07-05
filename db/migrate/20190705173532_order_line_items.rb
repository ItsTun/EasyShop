class OrderLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_line_items do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity
      t.integer :amount
      t.timestamps null: false
    end
  end
end
