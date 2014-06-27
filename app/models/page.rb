class Page < ActiveRecord::Base
  has_many :references
  has_many :connections
  has_many :collaborators, through: :connections
end
