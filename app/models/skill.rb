class Skill < ActiveRecord::Base
  extend Export
  include ActivityLogs

  has_many :users, through: :skill_users
  has_many :skill_users, dependent: :destroy

  validates :name, presence: true

  after_create :log_create
  after_update :log_update
  after_destroy :log_destroy

  def self.import file
    CSV.foreach(file.path, headers: true) do |row|
      skill = find_by_id(row["id"]) || new
      skill.attributes = row.to_hash.slice *row.to_hash.keys
      skill.save!
    end
  end
end
