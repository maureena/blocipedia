class Page < ActiveRecord::Base
  has_many :references
  has_many :connections
  has_many :editors, through: :connections
  has_many :invitations
  accepts_nested_attributes_for :references, allow_destroy: true

end
