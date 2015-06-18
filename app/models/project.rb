class Project < ActiveRecord::Base
  extend Export
  
  has_many :users, through: :project_users
  has_many :project_users, dependent: :destroy

  validates :name, presence: true
end
