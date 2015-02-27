class ModifyOwnerIdToDestinations < ActiveRecord::Migration
  def change
    rename_column :destinations, :owner_id, :itinerary_id
  end
end
