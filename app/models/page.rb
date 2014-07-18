class Page < ActiveRecord::Base
  has_many :references
  has_many :connections
  has_many :editors, through: :connections
  has_many :invitations

  default_scope order: :title

end
