class PagePolicy < ApplicationPolicy

  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.paid?
        scope.all
      else
        scope.where(:public => true)
      end
    end
  end
  
  def index?
    true
  end

  def show?
    record.public? || user.present?
  end
  
end