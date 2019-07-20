class CreatePricings < ActiveRecord::Migration[5.2]
  def change
    create_table :pricings do |t|
      t.string :name
      t.integer :price
      t.integer :unit
      t.string :description
      t.timestamps
    end
  end
end
