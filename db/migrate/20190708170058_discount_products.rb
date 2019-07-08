class DiscountProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :discount_products, id: false do |t|
      t.belongs_to :product, index: true
      t.belongs_to :discount, index: true
    end
  end
end
