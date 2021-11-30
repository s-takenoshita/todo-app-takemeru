class Board < ApplicationRecord

  validates :name, presence: true
  validates :name, length: {minimum: 4, maximum: 100}

  validates :description, presence: true

  belongs_to :user
  
end
