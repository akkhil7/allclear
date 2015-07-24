class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :issue_id
end
