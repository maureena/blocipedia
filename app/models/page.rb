class Page < ActiveRecord::Base
  has_many :references
  has_many :connections
  has_many :editors, through: :connections
end
