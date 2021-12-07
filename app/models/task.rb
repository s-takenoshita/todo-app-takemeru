class Task < ApplicationRecord
  validates :title, presence: true

  belongs_to :board
  belongs_to :user

  has_many :comments, dependent: :destroy

end
