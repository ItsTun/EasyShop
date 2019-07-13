class AddShopCollectionMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_collections, id: false do |t|
      t.belongs_to :shop, index: true
      t.belongs_to :collection, index: true
    end
  end
end
