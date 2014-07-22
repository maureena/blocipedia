class PagePolicy < ApplicationPolicy

   class Scope
     attr_reader :user, :scope

     def initialize(user, scope)
       @user = user
       @scope = scope
     end

     def resolve
       if ( user.role?('paid') )
         scope.all
       else
         scope.where(public: true)
       end
     end
   end
  
  def index?
    true
  end

  def show?
    ( user.role?('paid') && record.editors.include?(user) ) || ( record.public? )
  end
  
end