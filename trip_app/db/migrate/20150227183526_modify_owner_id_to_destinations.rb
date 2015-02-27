class ModifyOwnerIdToDestinations < ActiveRecord::Migration
  def change
    rename_column :destinations, :owner_id, :user_id
  end
end
