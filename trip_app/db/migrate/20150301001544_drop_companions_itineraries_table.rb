class DropCompanionsItinerariesTable < ActiveRecord::Migration
  def change
    drop_table :companions_itineraries
  end
end
