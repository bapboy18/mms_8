class Skill < ActiveRecord::Base
  extend Export

  has_many :users, through: :skill_users
  has_many :skill_users, dependent: :destroy

  validates :name, presence: true
end
