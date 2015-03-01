class DropCompanionsTable < ActiveRecord::Migration
  def change
    drop_table :companions 
  end
end
