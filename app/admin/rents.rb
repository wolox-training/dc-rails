ActiveAdmin.register Rent do
  permit_params :user_id, :book_id, :from, :to

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
      f.input :user_id, as: :select, collection: User.all.collect { |user| [user.email, user.id] }
      f.input :book_id, as: :select, collection: Book.all.collect { |book| [book.title, book.id] }
      f.input :from
      f.input :to
    end
    f.actions
  end
end
