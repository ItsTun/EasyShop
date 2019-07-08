class Discounts < ActiveRecord::Migration[5.2]
  def change
    create_table :discounts do |t|
      t.string :discount_code
      t.string :discount_type
      t.integer :discount_value
      t.string :min_requirements
      t.date :discount_start_date
      t.date :discount_end_date
      t.timestamps null: false
    end
  end
end
