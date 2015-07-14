# == Schema Information
#
# Table name: issues
#
#  id             :integer          not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  project_id     :integer
#  assigned_to_id :integer
#  title          :string
#

class IssueSerializer < ActiveModel::Serializer
  attributes :id
end
