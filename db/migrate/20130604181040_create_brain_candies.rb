class CreateBrainCandies < ActiveRecord::Migration
  def change
    create_table :brain_candies do |t|
      t.string :name
      t.references :difficulty_level

      t.timestamps
    end
    add_attachment :brain_candies, :photo
    add_index :brain_candies, :difficulty_level_id
  end
end
