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

class Comment < ActiveRecord::Base
  belongs_to :issue
  belongs_to :user
end
