class PagePolicy < ApplicationPolicy

   class Scope
     attr_reader :user, :scope

     def initialize(user, scope)
       @user = user
       @scope = scope
     end

     def resolve
       if ( user.role?('paid') )
         scope
       else
         scope.where(public: true)
       end
     end
   end
  
  def index?
    true
  end

  def show?
    return true if ( user.role?('paid') && @page.editors.include?(user))
    return true if record.public? || user.present? 
    false
  end
  
end