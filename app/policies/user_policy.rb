class UserPolicy < ApplicationPolicy
  def rents_index?
    record == user
  end

  def create_rent?
    record.id == user.id
  end
end
