class CreateCompanionsItineraries < ActiveRecord::Migration
  def change
    create_table :companions_itineraries do |t|
      t.integer :companion_id
      t.integer :itinerary_id

      t.timestamps null: false
    end
  end
end
