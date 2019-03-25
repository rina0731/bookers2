class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :name, length: { in: 2..20 }

  validates :introduction, length: { maximum: 50}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 def email_required?
 	false
 end
 def email_changed?
 	false
 end
 attachment :profile_image

  has_many :books, dependent: :destroy
 end
