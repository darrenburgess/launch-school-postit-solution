class Api::V1::CommentSerializer < Api::V1::BaseSerializer
  attributes :id, :user_id, :body

  belongs_to :post
end
