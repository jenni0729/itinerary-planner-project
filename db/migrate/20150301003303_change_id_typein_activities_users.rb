class ChangeIdTypeinActivitiesUsers < ActiveRecord::Migration
  def change
    change_column :activities_users, :activity_id, :integer
    change_column :activities_users, :user_id, :integer
  end
end
