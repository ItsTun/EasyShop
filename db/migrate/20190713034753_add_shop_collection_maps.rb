class AddShopCollectionMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_collections, id: false do |t|
      t.belongs_to :shop_id, index: true
      t.belongs_to :collection_id, index: true
    end
  end
end
