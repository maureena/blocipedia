class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :references
  has_many :connections, foreign_key: "editor_id"
  has_many :pages, through: :connections
  has_many :invitations, class_name: "Invite", foreign_key: 'recipient_id'
  has_many :sent_invites, class_name: "Invite", foreign_key: 'sender_id'
end
