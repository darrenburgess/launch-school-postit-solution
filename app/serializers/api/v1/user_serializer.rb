class Api::V1::UserSerializer < Api::V1::BaseSerializer
  attributes :id, :username, :first_name, :last_name

  has_many :posts
end
