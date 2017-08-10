class UserPolicy < ApplicationPolicy
  def rents_index?
    record == user
  end
end
