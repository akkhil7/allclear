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
#  priority       :string
#

class Issue < ActiveRecord::Base
  belongs_to :project
  has_many :comments
  belongs_to :assigned_to, class_name: 'User', foreign_key: :assigned_to_id
end
