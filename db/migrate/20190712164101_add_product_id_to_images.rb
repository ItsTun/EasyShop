class AddProductIdToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :product_id, :int
  end
end
