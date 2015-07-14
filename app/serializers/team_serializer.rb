# == Schema Information
#
# Table name: teams
#
#  id            :integer          not null, primary key
#  user_id       :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  created_by_id :integer
#

class TeamSerializer < ActiveModel::Serializer
  attributes :id
end
