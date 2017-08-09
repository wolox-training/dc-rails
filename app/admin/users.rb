ActiveAdmin.register User do
  permit_params :first_name, :last_name, :email, :locale, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :locale
    column :password
  end

  filter :email
  filter :locale
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :locale
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
