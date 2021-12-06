class Task < ApplicationRecord
  validates :title, presence: true

  belongs_to :board
  belongs_to :user

end
