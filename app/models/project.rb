class Project < ActiveRecord::Base
  has_many :users, through: :project_users
  has_many :project_users, dependent: :destroy

  validates :name, presence: true
  validates :team_id, presence: true
end
