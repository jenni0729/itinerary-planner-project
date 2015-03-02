class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :location
      t.string :name
      t.integer :destinations_id
      t.date :date

      t.timestamps null: false
    end
  end
end
