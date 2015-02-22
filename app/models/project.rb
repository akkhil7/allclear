class Project < ActiveRecord::Base
  belongs_to :created_by, class_name: "User", foreign_key: :created_by_id
  has_many :memberships
  has_many :users, :through => :memberships
  has_many :issues, dependent: :destroy
end
