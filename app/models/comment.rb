class Comment < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post
  has_many :votes, as: :voteable

  validates :body, presence: true
  validates :author, presence: true

  def total_votes
    up_votes = self.votes.where(vote: true).size
    down_votes = self.votes.where(vote: false).size
    up_votes - down_votes
  end
end
