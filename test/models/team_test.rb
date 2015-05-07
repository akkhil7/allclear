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

require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
