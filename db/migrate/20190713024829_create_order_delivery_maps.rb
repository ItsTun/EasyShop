class CreateOrderDeliveryMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :order_deliveries, id: false do |t|
      t.belongs_to :order, index: true
      t.belongs_to :delivery, index: true
    end
  end
end
