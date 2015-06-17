class Activity < ActiveRecord::Base
  enum action: [:admin_create, :admin_update, :admin_destroy]

  def self.remove_old_activity
    Activity.all.each {|activity|
      activity.destroy if (activity.created_at + Settings.activities.days_of_week.days) < Time.zone.now
    }
  end
end
