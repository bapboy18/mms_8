class User < ActiveRecord::Base
  require "csv"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :positions, through: :position_users
  has_many :position_users, dependent: :destroy
  has_many :teams, through: :team_users
  has_many :team_users, dependent: :destroy

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

  def self.import file
    CSV.foreach(file.path, headers: true) do |row|
      user_hash = row.to_hash
      user = User.where id: user_hash["id"]
      if user.count == 1
        user.first.update_attributes user_hash
      else
        User.create!(user_hash)
      end
    end
  end
end
