class Connection < ActiveRecord::Base
    belongs_to :page
    belongs_to :editor, class_name: "User"
end
