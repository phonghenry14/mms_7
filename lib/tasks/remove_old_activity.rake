desc "remove old activity"
task remove_old_activity: :environment do
  Activity.remove_old_activity
end
