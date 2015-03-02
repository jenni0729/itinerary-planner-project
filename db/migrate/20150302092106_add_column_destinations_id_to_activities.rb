class AddUserIdColumnToReviews < ActiveRecord::Migration
  def change
      rename_column :activities, :destinations_id, :itinerary_id
  end
end