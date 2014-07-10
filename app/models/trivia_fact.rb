class TriviaFact < ActiveRecord::Base
  has_many :votes
  has_many :favorites
  belongs_to :category
  belongs_to :user
  validates :question, presence: true, uniqueness: true
  validates :answer, presence: true
  validates :category, presence: true
  paginates_per 21

  def total_votes
    votes.sum(:vote)
  end

  def update_rank
    update(rank: total_votes)
  end
end
