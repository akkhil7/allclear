class Project < ActiveRecord::Base
  belongs_to :created_by, class_name: "User", foreign_key: :created_by_id
  has_many :memberships
  has_many :users, :through => :memeberships
  has_many :issues
end
