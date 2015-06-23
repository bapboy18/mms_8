class Project < ActiveRecord::Base
  extend Export

  has_many :users, through: :project_users
  has_many :project_users, dependent: :destroy
  belongs_to :team

  validates :name, presence: true
  validates :team_id, presence: true

  after_save :assign_user

  private
  def assign_user
    team.users.each{|user| project_users.create! user: user, joined_date: start_date}
  end
end
