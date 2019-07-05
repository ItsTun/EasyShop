class Orders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :shop_owner_id
      t.string :order_type
      t.integer :amount
      t.timestamps null: false
    end
  end
end
