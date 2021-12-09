class Task < ApplicationRecord
  has_one_attached :eyecatch
  
  validates :title, presence: true

  belongs_to :board
  belongs_to :user

  has_many :comments, dependent: :destroy

  def board_name
    self.board.name
  end

  def comments_count
    comments.count
  end

end
