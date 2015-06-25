module ActivityLogs
  def log_create
    create_activity_log Settings.activities.create
  end

  def log_update
    create_activity_log Settings.activities.update
  end

  def log_destroy
    create_activity_log Settings.activities.destroy
  end

  private
  def create_activity_log action_name
    @activity = Activity.new
    @activity.action = action_name
    @activity.object = "#{model_name}"
    @activity.description = "#{@activity.action} #{@activity.object}"
    @activity.save
  end
end
