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

class Project < ActiveRecord::Base
  belongs_to :created_by, class_name: "User", foreign_key: :created_by_id
  has_many :memberships
  has_many :users, :through => :memberships
  has_many :issues
end
