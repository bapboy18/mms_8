class Project < ActiveRecord::Base
  extend Export
  include ActivityLogs

  has_many :users, through: :project_users
  has_many :project_users, dependent: :destroy
  belongs_to :team

  validates :name, presence: true
  validates :team_id, presence: true

  after_save :assign_user
  after_create :log_create
  after_update :log_update
  after_destroy :log_destroy

  private
  def assign_user
    team.users.each{|user| project_users.create! user: user, joined_date: start_date}
  end
end
