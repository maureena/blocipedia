class Page < ActiveRecord::Base
  has_many :references
  has_many :connections
  has_many :editors, through: :connections
  has_many :invitations
<<<<<<< HEAD

  default_scope order: :title
=======
  accepts_nested_attributes_for :references, allow_destroy: true
>>>>>>> master

end
