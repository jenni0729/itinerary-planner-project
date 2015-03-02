class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :content
      t.string :reviewable_type
      t.string :reviewable_id

      t.timestamps null: false
    end
  end
end
