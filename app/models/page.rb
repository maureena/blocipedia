class Page < ActiveRecord::Base
  has_many :references
  has_many :connections
  has_many :editors, through: :connections
  has_many :invitations

  scope :visible_to, ->(user) { user ? all : where(public: true) }
end
