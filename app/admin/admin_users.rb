ActiveAdmin.register User do
  permit_params :email, :name, :user_name, :contact_number, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :name
    column :user_name
    column :contact_number
    column :roles do |user|
      user.roles.collect{ |c| c.name.capitalize }.to_sentence
    end
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :name
      f.input :user_name
      f.input :contact_number
      f.input :roles, as: :check_boxes, collection: Role.all
    end
    f.actions
  end

end
