class AddNameContactNumberDescriptionSignInCountUserNameUserType < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :contact_number, :string
    add_column :users, :description, :string
    add_column :users, :sign_in_count, :integer
    add_column :users, :user_name, :string
    add_column :users, :user_type, :string
  end
end
