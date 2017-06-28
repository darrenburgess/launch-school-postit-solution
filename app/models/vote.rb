class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true
  
  # the problem here appears to be that this validation
  # is not specific enough to handle votes with duplicate
  # user_id's from both the Post and Comment models
  validates_uniqueness_of :user, scope: [:voteable_id, :voteable_type]
end
