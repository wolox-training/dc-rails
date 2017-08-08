class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :rents_count

  def rents_count
    object.rents.count
  end
end
