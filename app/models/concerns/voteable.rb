module Voteable
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :voteable
  end

  def total_votes
    up_votes = self.votes.where(vote: true).size
    down_votes = self.votes.where(vote: false).size
    up_votes - down_votes
  end
end