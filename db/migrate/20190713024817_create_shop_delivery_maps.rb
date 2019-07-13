class CreateShopDeliveryMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_deliveries, id: false do |t|
      t.belongs_to :shop, index: true
      t.belongs_to :delivery, index: true
    end
  end
end
