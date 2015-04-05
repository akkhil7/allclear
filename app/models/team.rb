class Team < ActiveRecord::Base
  belongs_to :user
  belongs_to :teammate, :class_name => "User"
end
