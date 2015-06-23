class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :positions, through: :position_users
  has_many :position_users, dependent: :destroy
  has_many :teams, through: :team_users
  has_many :team_users, dependent: :destroy
  has_many :projects, through: :project_users
  has_many :project_users, dependent: :destroy

  query = "id not in (select user_id from team_users)"
  scope :not_in_team, ->{where query}

  has_many :teams, through: :team_users
  has_many :team_users, dependent: :destroy

  has_many :skills, through: :skill_users
  has_many :skill_users, dependent: :destroy

  accepts_nested_attributes_for :position_users, allow_destroy: true
  accepts_nested_attributes_for :team_users, allow_destroy: true
  accepts_nested_attributes_for :skill_users, allow_destroy: true

  Settings.roles.each do |v|
    define_method("is_#{v}?") {role == v}
  end
end
