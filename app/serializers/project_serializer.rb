# == Schema Information
#
# Table name: projects
#
#  id            :integer          not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  created_by_id :integer
#

class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_by, :issues
end
