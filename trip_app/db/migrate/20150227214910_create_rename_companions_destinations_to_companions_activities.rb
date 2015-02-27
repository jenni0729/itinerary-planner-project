class CreateRenameCompanionsDestinationsToCompanionsActivities < ActiveRecord::Migration
  def change
    rename_table :companions_destinations, :companions_activities
  end
end
