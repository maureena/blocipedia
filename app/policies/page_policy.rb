class PagePolicy < ApplicationPolicy

  # class Scope
  #   attr_reader :user, :model

  #   def initialize(user, model)
  #     @user = user
  #     @model = model
  #   end

  #   def resolve
  #     if ( user.role?('paid') )
  #       @model
  #     else
  #       scope.where(:public => true)
  #     end
  #   end
  # end
  
  def index?
    true
  end

  def show?
    record.public? || user.present?
  end
  
end