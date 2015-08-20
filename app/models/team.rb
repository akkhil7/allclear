# == Schema Information
#
# Table name: teams
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  created_by_id :integer
#  user_id       :integer
#

class Team < ActiveRecord::Base
  belongs_to :created_by, class_name: 'User', foreign_key: :created_by_id
  has_many :users


end
