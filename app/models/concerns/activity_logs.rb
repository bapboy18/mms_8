module ActivityLogs
  def create_activity_log action_name, class_name
    @activity = Activity.new
    @activity.action = action_name
    @activity.object = class_name
    @activity.description = "#{@activity.action} #{@activity.object}"
    @activity.save
  end

  private
  def log_create
    create_activity_log Settings.activities.create, self.class.name
  end

  def log_update
    create_activity_log Settings.activities.update, self.class.name
  end

  def log_destroy
    create_activity_log Settings.activities.destroy, self.class.name
  end
end
