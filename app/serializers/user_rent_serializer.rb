class UserRentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :book_id, :from, :to, :book, :user

  has_one :book , serializer: OneBookSerializer
  has_one :user , serializer: UserSerializer
end
