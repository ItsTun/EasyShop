class AddCategoryIdToCollectionsProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :collections, :category_id, :int
    add_column :products, :category_id, :int
  end
end
