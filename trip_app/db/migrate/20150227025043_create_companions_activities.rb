class CreateCompanionsActivities < ActiveRecord::Migration
  def change
    create_table :companions_activities do |t|
      t.integer :destination_id
      t.integer :companion_id

      t.timestamps null: false
    end
  end
end
