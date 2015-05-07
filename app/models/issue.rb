# == Schema Information
#
# Table name: issues
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer
#

class Issue < ActiveRecord::Base
  belongs_to :project
  has_many :comments
end
