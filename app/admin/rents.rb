ActiveAdmin.register Rent do
  permit_params :user, :book, :from, :to

  index do
    selectable_column
    id_column
    column :user
    column :book
    column :from
    column :to
  end

  filter :user
  filter :book
  filter :from
  filter :to

  form do |f|
    f.inputs do
      f.input :user, as: :select, collection: User.all.collect { |user| [user.email] }
      f.input :book, as: :select, collection: Book.all.collect { |book| [book.title] }
      f.input :from
      f.input :to
    end
    f.actions
  end
end
