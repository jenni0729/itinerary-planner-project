class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.integer :itinerary_id
      t.string :email

      t.timestamps null: false
    end
  end
end
