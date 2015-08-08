# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  username               :string
#  team_id                :integer
#  first_name             :string
#  last_name              :string
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :team
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :memberships
  has_many :projects, :through => :memberships
  has_many :notifications
  has_many :comments
  has_many :issues, :foreign_key => :assigned_to_id

  after_save :assign_team

  def assign_team
    @team = Team.new()
    @team.created_by_id = self.id
    @team.user_id = self.id
    if @team.save!
      self.team_id = @team.id
    end
  end

end
