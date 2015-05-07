# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  project_id :integer
#

class Membership < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
end
