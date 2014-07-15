class PagePolicy < ApplicationPolicy
  
  def index?
    true
  end

  def show?
    record.public? || user.present?
  end
  
end