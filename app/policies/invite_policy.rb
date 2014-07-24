class InvitePolicy < ApplicationPolicy

  def new?
    user.present? && (user.role?(:paid) || user.role?(:admin))
  end

  def create?
    new?
  end

end