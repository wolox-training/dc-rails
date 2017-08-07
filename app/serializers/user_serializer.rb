class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :rents_count

  def rents_count
    Rent.where('user_id = ?', object.id).count
  end
end
