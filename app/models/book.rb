class Book < ApplicationRecord
 validates :title, presence: true
  validates :opinion, length: { in: 1..200 }
	belongs_to :user

end
