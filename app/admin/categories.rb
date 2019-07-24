ActiveAdmin.register Category do
permit_params :title

  index do
    selectable_column
    id_column
    column :title
    column :created_at
    column :updated_at
    actions
  end

  filter :title

  form do |f|
    f.inputs do
      f.input :title
    end
    f.actions
  end
end
