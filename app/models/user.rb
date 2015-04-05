class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :teams
  has_many :teammates, :through => :teams
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  has_many :memberships
  has_many :projects, :through => :memberships
  has_many :notifications
end
