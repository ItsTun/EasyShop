class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :payment_id
      t.integer :quantity
      t.string :status
      t.string :type
      t.datetime :start_at
      t.datetime :expire_at
      t.integer :fullfilled_by
      t.datetime :fullfilled_at
      t.integer :fullfilled_price
      t.timestamps
    end
  end
end
