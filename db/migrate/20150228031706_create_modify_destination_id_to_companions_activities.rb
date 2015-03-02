class CreateModifyDestinationIdToCompanionsActivities < ActiveRecord::Migration
  def change
    rename_column :companions_activities, :destination_id, :activity_id
  end
end
