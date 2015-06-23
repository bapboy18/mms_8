class Team < ActiveRecord::Base
  extend Export
  include ActivityLogs

  has_many :users, through: :team_users
  has_many :team_users, dependent: :destroy
  has_many :projects, dependent: :destroy

  accepts_nested_attributes_for :team_users, allow_destroy: true
  accepts_nested_attributes_for :projects,
                                reject_if: proc {|attributes| attributes["description"].blank?},
                                allow_destroy: true

  after_create :log_create
  after_update :log_update
  after_destroy :log_destroy

  def self.import file
    CSV.foreach(file.path, headers: true) do |row|
      team = find_by_id(row["id"]) || new
      team.attributes = row.to_hash.slice *row.to_hash.keys
      team.save!
    end
  end
end
