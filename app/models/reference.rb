class Reference < ActiveRecord::Base
  belongs_to :page
  belongs_to :user
end
