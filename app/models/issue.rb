class Issue < ActiveRecord::Base
  belongs_to :project, dependent: :destroy
end
