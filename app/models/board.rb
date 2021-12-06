class Board < ApplicationRecord

  validates :name, presence: true
  validates :name, length: {minimum: 4, maximum: 100}

  validates :description, presence: true

  has_many :tasks, dependent: :destroy
  belongs_to :user
  
end
