class TeamUser < ActiveRecord::Base
  belongs_to :users
  belongs_to :teams
end
