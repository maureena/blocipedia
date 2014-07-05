class Page < ActiveRecord::Base

  has_many :references
  accepts_nested_attributes_for :references, :reject_if => :all_blank, 
                :allow_destroy => true
  has_many :connections
  has_many :editors, through: :connections
  has_many :invitations
end
