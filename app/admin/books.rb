ActiveAdmin.register Book do
  permit_params :genere, :author, :image, :title, :publisher, :year

  index do
    selectable_column
    id_column
    column :genere
    column :author
    column :image
    column :title
    column :publisher
    column :year
  end

  filter :genere
  filter :author
  filter :year

  form do |f|
    f.inputs do
      f.input :genere
      f.input :author
      f.input :image
      f.input :title
      f.input :publisher
      f.input :year
    end
    f.actions
  end
end
