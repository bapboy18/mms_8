class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :team_users, dependent: :destroy
  has_many :teams, throught: :team_users, foreign_key: "user_id",
    dependent: :destroy

  Settings.roles.each do |v|
    define_method("is_#{v}?") {role == v}
  end
end
