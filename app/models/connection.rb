class Connection < ActiveRecord::Base
    belongs_to :page
    belongs_to :owner, class_name: "User"
    belongs_to :collaborater, class_name: "User"
end
