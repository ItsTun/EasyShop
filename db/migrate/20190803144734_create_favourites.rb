class CreateFavourites < ActiveRecord::Migration[5.2]
  def change
    create_table :favourites, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :product, index: true
      t.timestamps
    end
  end
end
