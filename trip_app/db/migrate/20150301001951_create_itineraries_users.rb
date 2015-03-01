class CreateItinerariesUsers < ActiveRecord::Migration
  def change
    create_table :itineraries_users do |t|
      t.integer :user_id
      t.integer :itinerary_id
      t.boolean :is_owner

      t.timestamps null: false
    end
  end
end
