class Team < ActiveRecord::Base
  has_many :team_users, dependent: :destroy
  has_many :users, throught: :team_users, foreign_key: "team_id",
    dependent: :destroy
end
