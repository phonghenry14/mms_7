class Activity < ActiveRecord::Base
  enum action: [:admin_create, :admin_update, :admin_destroy]

  scope :old_activity, ->{where("created_at < ?", Settings.activities.days_of_week.days.ago)}

  def self.remove_old_activity
    Activity.old_activity.destroy_all
  end
end
