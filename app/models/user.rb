class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, uniqueness: true
  validates :username, presence: true
  validates :username, length: { in: 2..20 }

  validates :introduction, length: { maximum: 50}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:username]
 def email_required?
 	false
 end
 def email_changed?
 	false
 end
 attachment :profile_image

  has_many :books, dependent: :destroy
 end
