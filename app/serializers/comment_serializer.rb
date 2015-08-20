# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  issue_id   :integer
#  body       :string
#  user_id    :integer
#

class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :issue_id
end
