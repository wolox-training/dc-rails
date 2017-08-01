class BookSerializer < ActiveModel::Serializer
  attributes :author, :title, :genere, :description
end
