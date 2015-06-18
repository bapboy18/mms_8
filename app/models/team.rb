class Team < ActiveRecord::Base
  has_many :users, through: :team_users
  has_many :team_users, dependent: :destroy
  has_many :projects, dependent: :destroy

  accepts_nested_attributes_for :team_users, allow_destroy: true
  accepts_nested_attributes_for :projects,
                                reject_if: proc {|attributes| attributes["description"].blank?},
                                allow_destroy: true
end
