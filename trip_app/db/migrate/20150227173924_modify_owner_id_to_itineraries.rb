class ModifyOwnerIdToItineraries < ActiveRecord::Migration
  def change
    rename_column :itineraries, :owner_id, :user_id
  end
end
