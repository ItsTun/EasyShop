class Products < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.integer :original_price
      t.integer :quantity
      t.integer :collection_id
      t.integer :shop_owner_id
      t.integer :image_id
      t.timestamps null: false
    end
  end
end
