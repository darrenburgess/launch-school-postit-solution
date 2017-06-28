class Post < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :votes, as: :voteable

  validates :title, presence: true, length: {minimum: 5}
  validates :url, presence: true, uniqueness: true
  validates :description, presence: true
  validates :creator, presence: true

  def total_votes
    up_votes = self.votes.where(vote: true).size
    down_votes = self.votes.where(vote: false).size
    up_votes - down_votes
  end
end
