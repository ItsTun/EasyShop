ActiveAdmin.register ShopOrder do
permit_params :quantity, :status, :payment_method, :start_at, :expired_at, :fulfiled_by, :fulfiled_at, :fulfiled_price

  index do
    selectable_column
    id_column
    column :user_id
    column :pricing_id
    column :quantity
    column :status
    column :payment_method
    column :start_at
    column :expired_at
    column :fulfiled_by
    column :fulfiled_at
    column :fulfiled_price
    column :orderable_type
    column :created_at
    actions
  end

  filter :user_id
  filter :fulfiled_by
  filter :created_at

  form do |f|
    f.inputs do
      f.input :user_id
      f.input :pricing_id
      f.input :quantity
      f.input :status
      f.input :payment_method
      f.input :start_at
      f.input :expired_at
      f.input :fulfilled_by
      f.input :fulfilled_at
      f.input :fulfilled_price
      f.input :orderable_type
    end
    f.actions
  end

end
