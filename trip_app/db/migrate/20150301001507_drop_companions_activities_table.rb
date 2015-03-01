class DropCompanionsActivitiesTable < ActiveRecord::Migration
  def change
    drop_table :companions_activities
  end
end
