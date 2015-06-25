class Activity < ActiveRecord::Base
  enum action: [:admin_create, :admin_update, :admin_destroy]

  scope :activity_last_week, ->{where("created_at < ?", 1.week.ago)}

  class << self
    def delete_activity
      Activity.activity_last_week.destroy_all
    end
  end
end
