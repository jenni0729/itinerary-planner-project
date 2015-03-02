class CreateCompanions < ActiveRecord::Migration
  def change
    create_table :companions do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :is_owner

      t.timestamps null: false
    end
  end
end
