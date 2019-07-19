class CreateShopsSubscribers < ActiveRecord::Migration[5.2]
  def change
    create_table :shops_subscribers, id: false do |t|
      t.belongs_to :shop, index: true
      t.belongs_to :user, index: true
    end
  end
end
