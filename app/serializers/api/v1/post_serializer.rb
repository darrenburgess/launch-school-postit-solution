class Api::V1::PostSerializer < Api::V1::BaseSerializer
  attributes :id, :title

  belongs_to :user
  has_many :comments
end
