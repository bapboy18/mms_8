class Team < ActiveRecord::Base
  extend Export

  has_many :users, through: :team_users
  has_many :team_users, dependent: :destroy

  accepts_nested_attributes_for :team_users, allow_destroy: true
end
