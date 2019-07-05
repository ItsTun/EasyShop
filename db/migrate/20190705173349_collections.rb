class Collections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.string :title
      t.string :description
      t.timestamps null: false
    end
  end
end
