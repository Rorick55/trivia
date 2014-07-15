class User < ActiveRecord::Base
  has_many :trivia_facts
  has_many :favorites
  has_many :trivia_facts, through: :favorites
  has_many :votes
  has_many :quiz_responses
  has_many :quizzes, through: :quiz_responses
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :role, inclusion: { in: ['user', 'admin'] }

  def admin?
    role == "admin"
  end
end
