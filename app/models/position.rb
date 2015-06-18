class Position < ActiveRecord::Base
  extend Export

  has_many :users, through: :position_users
  has_many :position_users, dependent: :destroy

  validates :name, presence: true
end
