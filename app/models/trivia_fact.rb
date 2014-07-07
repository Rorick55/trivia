class TriviaFact < ActiveRecord::Base
  has_many :votes
  belongs_to :category
  belongs_to :user
  validates :question, presence: true, uniqueness: true
  validates :answer, presence: true
  validates :category, presence: true

  def total_votes
    votes.sum(:vote)
  end

  def update_rank
    update(rank: total_votes)
  end
end
