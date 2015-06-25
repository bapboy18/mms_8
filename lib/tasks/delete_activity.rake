desc "delete old activity"
task delete_activity: :environment do
  Activity.delete_activity
end
