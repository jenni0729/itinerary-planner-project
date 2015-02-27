class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :location
      t.string :name
      t.integer :owner_id
      t.date :date

      t.timestamps null: false
    end
  end
end
