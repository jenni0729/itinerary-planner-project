class CreateRenameDestinationsToActivities < ActiveRecord::Migration
  def change
    rename_table :destinations, :activities

  end
end
