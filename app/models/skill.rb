class Skill < ActiveRecord::Base
  extend Export
  include ActivityLogs

  has_many :users, through: :skill_users
  has_many :skill_users, dependent: :destroy

  validates :name, presence: true

  after_create :log_create
  after_update :log_update
  after_destroy :log_destroy
end
